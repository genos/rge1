(asdf:defsystem #:rge1
  :depends-on (#:uiop #:lparallel)
  :serial t
  :components ((:file "package")
               (:file "rge1"))
  :build-operation "program-op"
  :build-pathname "rge1"
  :entry-point "rge1:main")
