(defun make-op (str) (uiop:split-string str :separator " "))

(defun read-ops (input-file) (mapcar #'make-op (uiop:read-file-lines input-file))) 
