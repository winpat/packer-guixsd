(use-modules (gnu))
(use-service-modules networking ssh)
(use-package-modules screen)

(operating-system
  (host-name "guixsd")
  (timezone "Europe/Zurich")
  (locale "en_US.utf8")

  (keyboard-layout (keyboard-layout "us" "altgr-intl"))

  (bootloader (bootloader-configuration
                (bootloader grub-bootloader)
                (target "/dev/vda")
                (keyboard-layout keyboard-layout)))

  (file-systems (append
                 (list (file-system
                         (device (file-system-label "ROOT"))
                         (mount-point "/")
                         (type "ext4")))
                 %base-file-systems))

  (users (cons (user-account
                (name "user")
                (comment "Example user")
                (group "users")
                (supplementary-groups '("wheel" "netdev"
                                        "audio" "video")))
               %base-user-accounts))

  (packages (cons screen %base-packages))

  (services (append (list (service dhcp-client-service-type)
			  (service openssh-service-type
				   (openssh-configuration
				    (permit-root-login #t)
				    (port-number 22))))
                    %base-services))

  (name-service-switch %mdns-host-lookup-nss))
