#!/bin/bash

# Verifica se foi fornecido o caminho da partição raiz montada
if [ -z "$1" ]; then
    echo "Uso: sudo $0 /mnt/sua-particao"
    exit 1
fi

TARGET="$1"

# Verifica se está sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "Por favor, execute como root."
    exit 1
fi

# Verifica se o diretório fornecido existe
if [ ! -d "$TARGET" ]; then
    echo "O diretório $TARGET não existe."
    exit 1
fi

echo "[*] Montando sistemas de arquivos essenciais..."

mount --types proc /proc "$TARGET/proc"
mount --rbind /sys "$TARGET/sys"
mount --make-rslave "$TARGET/sys"
mount --rbind /dev "$TARGET/dev"
mount --make-rslave "$TARGET/dev"
mount --bind /run "$TARGET/run"

# Verifica se o /etc/resolv.conf existe e copia temporariamente se necessário
if [ ! -e "$TARGET/etc/resolv.conf" ]; then
    echo "[*] Copiando /etc/resolv.conf para acesso à internet..."
    cp /etc/resolv.conf "$TARGET/etc/resolv.conf"
fi

echo "[*] Acessando o ambiente chroot..."
chroot "$TARGET" /bin/bash

echo "[*] Saindo do chroot. Desmontando sistemas de arquivos..."

umount -l "$TARGET/run"
umount -R "$TARGET/dev"
umount -R "$TARGET/sys"
umount "$TARGET/proc"

echo "[*] Feito!"

