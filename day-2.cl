(defun make-op (str) 
  (let ((str (uiop:split-string str :separator " "))) 
    (list (car str) (parse-integer (nth 1 str)))))

(defun read-ops (input-file) (mapcar #'make-op (uiop:read-file-lines input-file))) 

(defun decode-op (op)
   (destructuring-bind (action value) op 
     (cond ((string= action "forward") (list value 0))
           ((string= action "up")      (list 0 (- value)))
           ((string= action "down")    (list 0 value))
           (t (list 0 0)))))

(defun concat-op (op1 op2)
    (list (+ (car op1) (car op2)) (+ (nth 1 op1) (nth 1 op2))))

(defun run-file (input-file) (reduce #'concat-op (mapcar #'decode-op (read-ops input-file))))

(defun answer-1 (input-file) (apply #'* (run-file input-file)))