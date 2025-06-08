# 🔧 auto-chroot.sh

Script para automatizar o processo de `chroot` em distribuições Linux **baseadas no Debian**  
(Debian, Ubuntu, Linux Mint, etc).

---

## 📌 Requisitos

- Live CD/USB de qualquer distro com acesso root
- Conhecimento da partição raiz que você quer acessar
- Partição montada antes da execução

---

## 📥 Download

Clone o repositório e torne o script executável:

```bash
git clone https://github.com/Danielbompanda/ChrootHelp.git
cd ChrootHelp
chmod +x script-chroot.sh

🚀 Como usar
1. Monte a partição raiz do sistema que será acessado
bash
Copiar
Editar
sudo mount /dev/sdXn /mnt
Exemplo:

bash
Copiar
Editar
sudo mount /dev/sda2 /mnt
📌 Se o sistema usa /boot/efi separado (UEFI), monte também:

bash
Copiar
Editar
sudo mount /dev/sdXn /mnt/boot/efi
2. Execute o script
bash
Copiar
Editar
sudo ./script-chroot.sh /mnt
3. Dentro do ambiente chroot
Agora você pode fazer qualquer manutenção:

bash
Copiar
Editar
grub-install /dev/sda
update-grub
apt update
passwd
exit
Ao digitar exit, o script desmonta os sistemas automaticamente.

🔙 Exemplo completo
bash
Copiar
Editar
sudo mount /dev/sda2 /mnt
sudo mount /dev/sda1 /mnt/boot/efi  # Se for UEFI
sudo ./auto-chroot.sh /mnt

# Dentro do chroot:
grub-install /dev/sda
update-grub
exit
⚠️ Observações
O script monta automaticamente:

/proc

/sys

/dev

/run

Copia temporariamente o /etc/resolv.conf para garantir acesso à internet dentro do chroot.

🛠️ Suporte a recursos avançados
Se você utiliza:

LUKS (criptografia)

LVM (volumes lógicos)

RAID

ZFS

Monte manualmente os volumes necessários antes de executar o script.

Quer suporte automático para isso? Abra uma issue ou PR! 😉

📄 Licença
OPL 3.0

🤝 Contribuições
Sinta-se livre para abrir PRs com melhorias, correções ou adicionar suporte para outras distros!

yaml
Copiar
Editar

---

Se quiser, posso te ajudar a montar esse repositório inteiro com estrutura e `.gitignore` básico. Deseja isso também?
