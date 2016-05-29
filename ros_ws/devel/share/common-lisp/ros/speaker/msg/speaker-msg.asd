
(cl:in-package :asdf)

(defsystem "speaker-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "record" :depends-on ("_package_record"))
    (:file "_package_record" :depends-on ("_package"))
  ))