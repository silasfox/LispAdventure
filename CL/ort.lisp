;;; This function first updates your standlist, then prints out of it the verbose description of the room and then the list of items in it.

(defun ort (*stand*)
  (update *stand*)
  (format t "~a~%" (cadr *standlist*))
  (format t "Du siehst: ~a~%" (caddr *standlist*))
  (format t "Was willst du tun?~%"))
