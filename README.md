🔧 auto-chroot.sh
Script para automatizar o processo de chroot em distribuições Linux baseadas no Debian (Debian, Ubuntu, Mint, etc).

📌 Requisitos
Distribuição live (ou outro Linux) com acesso root

Partição raiz da instalação montada em /mnt ou outro ponto

📥 Download
Você pode clonar o repositório (ou criar o arquivo manualmente):

bash
Copiar
Editar
git clone https://github.com/Danielbompanda/ChrootHelp.git
cd seu-repo
chmod +x auto-chroot.sh
🚀 Como usar
Monte a partição raiz do sistema que você quer acessar:

bash
Copiar
Editar
sudo mount /dev/sdXn /mnt
Substitua /dev/sdXn pela partição correta do seu sistema (exemplo: /dev/sda2).

Execute o script com sudo e informe o caminho da partição montada:

bash
Copiar
Editar
sudo ./auto-chroot.sh /mnt
O script irá:

Montar os sistemas de arquivos essenciais: /proc, /sys, /dev, /run

Copiar temporariamente o resolv.conf para garantir acesso à internet

Iniciar o ambiente chroot com /bin/bash

Faça as modificações necessárias dentro do ambiente chroot, como reinstalar GRUB, atualizar pacotes, corrigir configurações etc.

Quando sair do chroot (exit), o script desmontará automaticamente os sistemas de arquivos.

🔙 Exemplo completo
bash
Copiar
Editar
sudo mount /dev/sda2 /mnt
sudo ./auto-chroot.sh /mnt
# dentro do chroot:
grub-install /dev/sda
update-grub
exit
⚠️ Observações
Certifique-se de usar o dispositivo correto para grub-install, geralmente o disco (/dev/sda, não a partição /dev/sda1).

Para partições UEFI, certifique-se de montar o /boot/efi também antes de executar o script.

🛠️ Suporte a recursos avançados
Se você usa:

LUKS (criptografia)

LVM (volumes lógicos)

RAID

UEFI (/boot/efi separado)

Você pode montar esses volumes antes de executar o script. Se quiser, posso ajudar a estender o script com suporte automático para esses casos também.

