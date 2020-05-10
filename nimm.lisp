;;; A function to take something and put it into your inventory

(defvar *y* 1)

(defun nimm (*y*)
  (setf *y* (read))
  (cond ((eq *y* '1)
	 (setf *invent* (append *invent* (list (car (caddr *standlist*)))))
	 (setf (caddr *standlist*) (remove (car (caddr *standlist*)) (caddr *standlist*))))
	((eq *y* '2)
	 (setf *invent* (append *invent* (list (cadr (caddr *standlist*)))))
	 (setf (caddr *standlist*) (remove (cadr (caddr *standlist*)) (caddr *standlist*))))
	((eq *y* '3)
	 (setf *invent* (append *invent* (list (caddr (caddr *standlist*)))))
	 (setf (caddr *standlist*) (remove (caddr (caddr *standlist*)) (caddr *standlist*))))
	((eq *y* '4)
	 (setf *invent* (append *invent* (list (cadddr (caddr *standlist*))))))))
