(defun read-numbers (input-file) 
    (mapcar #'parse-integer (uiop:read-file-lines input-file)))

(defun increases (x y) (> y x))

(defun calculate-increases (input-file) 
  (let ((nums (read-numbers input-file)))
    (count t (mapcar #'increases nums (cdr nums)))))