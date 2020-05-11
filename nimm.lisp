;;; A function to take something and put it into your inventory

(defvar *y* 1)

(defun nimm (*y*)
  (setf *y* (read))
  (cond ((eq *y* '1)
	 (setf *invent* (cons (caaddr *standlist*) *invent*))
	 (setf (caddr *standlist*) (remove (caaddr *standlist*) (caddr *standlist*))))
	((eq *y* '2)
	 (setf *invent* (cons (cadr (caddr *standlist*)) *invent*))
	 (setf (caddr *standlist*) (remove (cadr (caddr *standlist*)) (caddr *standlist*))))
	((eq *y* '3)
	 (setf *invent* (cons (caddr (caddr *standlist*)) *invent*))
	 (setf (caddr *standlist*) (remove (caddr (caddr *standlist*)) (caddr *standlist*))))
	((eq *y* '4)
	 (setf *invent* (cons (cadddr (caddr *standlist*)) *invent*))
	 (setf (caddr *standlist*) (remove (cadddr (caddr *standlist*)) (caddr *standlist*))))))
