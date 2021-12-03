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

(defun run-file-1 (input-file) (reduce #'concat-op (mapcar #'decode-op (read-ops input-file))))

(defun answer-1 (input-file) (apply #'* (run-file-1 input-file)))

;; part 2

(defun apply-op (state op)
    (destructuring-bind (aim x y) state 
        (destructuring-bind (delta-x delta-aim) op
            (list (+ aim delta-aim) (+ x delta-x) (+ y (* delta-x (+ aim delta-aim)))))))


(defun run-file-2 (input-file) (reduce #'apply-op (mapcar #'decode-op (read-ops input-file)) :initial-value '(0 0 0)))

(defun answer-2 (input-file)
  (let ((res (run-file-2 input-file))) 
    (* (nth 1 res) (nth 2 res))))