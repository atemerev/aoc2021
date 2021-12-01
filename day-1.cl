(defun sum-over (list) (reduce #'+ list))

(defun triples (ns) (apply #'mapcar #'list (list ns (cdr ns) (cdr (cdr ns)))))

(defun increases (nums) (count t (mapcar #'< nums (cdr nums))))

(defun read-numbers (input-file) 
    (mapcar #'parse-integer (uiop:read-file-lines input-file)))

(defun calculate-increases (input-file) 
  (let ((nums (read-numbers input-file)))
    (increases nums)))

(defun slide-window-increases (input-file)
  (let* ((nums (read-numbers input-file))
        (tuples (triples nums)))
        (increases (mapcar #'sum-over tuples))))