#!/usr/bin/env bash

set -Eeuo pipefail

readonly INSTALL_URL="https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh"
readonly CONFIG_URL="https://core.xuanyuanhuangdi.org/config.zip"
readonly CONFIG_PATH="/usr/local/etc/v2ray/config.json"
readonly SERVICE_PATH="/etc/systemd/system/v2ray.service"
readonly ENVIRONMENT_LINE='Environment="V2RAY_VMESS_AEAD_FORCED=false"'

if [[ ${EUID} -ne 0 ]]; then
  echo "错误：请使用 root 权限运行此脚本。" >&2
  echo "例如：sudo bash $0" >&2
  exit 1
fi

for command_name in curl unzip systemctl; do
  if ! command -v "${command_name}" >/dev/null 2>&1; then
    echo "错误：缺少命令 ${command_name}。" >&2
    exit 1
  fi
done

tmp_dir=$(mktemp -d)
trap 'rm -rf "${tmp_dir}"' EXIT

echo "[1/5] 安装 V2Ray..."
bash <(curl --fail --show-error --silent --location "${INSTALL_URL}")

echo "[2/5] 下载配置文件..."
curl --fail --show-error --silent --location \
  --output "${tmp_dir}/config.zip" \
  "${CONFIG_URL}"

mapfile -t config_entries < <(
  unzip -Z1 "${tmp_dir}/config.zip" | awk -F/ '$NF == "config.json" { print }'
)

if [[ ${#config_entries[@]} -ne 1 ]]; then
  echo "错误：压缩包中应当仅包含一个 config.json，实际找到 ${#config_entries[@]} 个。" >&2
  exit 1
fi

unzip -p "${tmp_dir}/config.zip" "${config_entries[0]}" >"${tmp_dir}/config.json"
if [[ ! -s "${tmp_dir}/config.json" ]]; then
  echo "错误：压缩包中的 config.json 为空。" >&2
  exit 1
fi

echo "[3/5] 替换 V2Ray 配置..."
install -d -o root -g root -m 0755 "$(dirname "${CONFIG_PATH}")"
install -o root -g root -m 0644 "${tmp_dir}/config.json" "${CONFIG_PATH}"

if [[ ! -f ${SERVICE_PATH} ]]; then
  echo "错误：未找到 systemd 服务文件 ${SERVICE_PATH}。" >&2
  exit 1
fi

echo "[4/5] 更新 systemd 服务配置..."
awk -v environment_line="${ENVIRONMENT_LINE}" '
  $0 == environment_line { next }
  { print }
  $0 == "RestartPreventExitStatus=23" { print environment_line; inserted = 1 }
  END {
    if (!inserted) {
      exit 23
    }
  }
' "${SERVICE_PATH}" >"${tmp_dir}/v2ray.service" || {
  echo "错误：${SERVICE_PATH} 中未找到 RestartPreventExitStatus=23。" >&2
  exit 1
}

install -o root -g root -m 0644 "${tmp_dir}/v2ray.service" "${SERVICE_PATH}"

echo "[5/5] 重新加载 systemd 并重启 V2Ray..."
systemctl daemon-reload
systemctl restart v2ray

echo "完成：V2Ray 已安装、配置并重启。"
