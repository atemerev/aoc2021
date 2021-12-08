(defun sum-over (list) (reduce #'+ list))

(defun make-vector (str) 
  (mapcar #'parse-integer (mapcar 'string (coerce str 'list))))

(defun read-vectors (input-file)
  (mapcar #'make-vector (uiop:read-file-lines input-file)))

(defun totals (vecs)
  (mapcar #'sum-over (apply #'mapcar #'list vecs)))

(defun deltas (totals length) 
  (mapcar (lambda (n) (floor n (floor length 2))) totals))

(defun list-to-string (lst)
  (format nil "~{~A~}" lst))

(defun answer (input-file)
  (let* (
    (v1 (deltas (totals (read-vectors input-file)) 1000))
    (vec-len (length v1))) 
    
    vec-len)
)