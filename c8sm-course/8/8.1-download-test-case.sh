#!/bin/bash

SCRIPT_PATH=$(dirname "$(realpath "${BASH_SOURCE[0]}")")
# shellcheck source=/dev/null
. "${SCRIPT_PATH}/../../settings.sh"

curl "https://cc.sj-cdn.net/instructor/8hl21nyq8wmf-camunda/assets/1704461787/values.yaml?response-content-disposition=attachment&Expires=1724429734&Signature=OIeRDyqda2qqsSfS9GN54i~XdONdJyoYmPf3pblOBqn5M1daDh1ckSbsqMnGpFK4xVQwfd8qA~OjFGPhQ2n-x2XBue-1oL8pHb6ma9RHIq09Z9vIw1XbyvK1nOJLYvTQGx8NT93XZl7lK4GNe57yJn9wrQe0WxGoPtDkOY58MdIq~H1F9X9WC3lX9kYdsw4X-35rbS-FMrNrbjdpozXR2Ubnts8MxW2xFcP0cJ4SkPNYVBFMMeXpBXYWur2hFQesI8g7Nr-tA39siafinug1hJzV6WtUveHa-o-ZFdnJF6eERLg~hIo1WO5mjzqa4yVO09SfDLLlG2Ft~dNjtRWYeg__&Key-Pair-Id=APKAI3B7HFD2VYJQK4MQ" \
  > "${SCRIPT_PATH}/values.yaml"
