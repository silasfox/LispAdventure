;;; Inventory

(defvar *invent* (list *9*))

;;; Your position

(defvar *stand* *a*)

;;; Your position with a list of everything in it

(defvar *standlist* alist)

;;; A function to keep standlist up to date with stand

(defun update (*stand*)
  (cond ((eq *stand* *a*)
	 (setf *standlist* alist))
	((eq *stand* *b*)
	 (setf *standlist* blist))
	((eq *stand* *c*)
	 (setf *standlist* clist))
	((eq *stand* *d*)
	 (setf *standlist* dlist))
	((eq *stand* *f*)
	 (setf *standlist* flist))
	((eq *stand* *g*)
	 (setf *standlist* glist))
	((eq *stand* *i*)
	 (setf *standlist* ilist))
	((eq *stand* *k*)
	 (setf *standlist* klist))
	((eq *stand* *l*)
	 (setf *standlist* llist))
	((eq *stand* *m*)
	 (setf *standlist* mlist))
	((eq *stand* *n*)
	 (setf *standlist* nlist))
	((eq *stand* *o*)
	 (setf *standlist* olist))
	((eq *stand* *p*)
	 (setf *standlist* plist))
	((eq *stand* *q*)
	 (setf *standlist* qlist))))
