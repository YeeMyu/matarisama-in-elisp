;; matari sama
;; composed by Masahiro Miwa
;; programmed by Yusuke Morishita

; initialize
(setq init [1 1 1 1 1 1 1 1])
(setq matari (copy-sequence init))
(setq num (length matari))
(setq round 1)
(setq bname "*matari*")

(if (one-window-p t)
   (split-window)
)

; main
(if (not (get-buffer bname))
   (switch-to-buffer-other-window bname)
 (progn (setq buf (get-buffer bname))
   (kill-buffer buf)
   (switch-to-buffer-other-window bname)
 )
)

(insert (format "%3d %s\n" round matari))

(catch 'break
 (while t
;   (sit-for 0.5)
   (setq i 0)
   (while (< i num)
     (if (eq i 0)
         (aset matari i (logxor(aref matari (- num 1)) (aref matari i)))
       (aset matari i (logxor(aref matari (- i 1)) (aref matari i)))
     )
     (setq i (1+ i))
   )
   (setq round (1+ round))
   (insert (format "%3d %s\n" round matari))
   (if (equal init matari)
     (throw 'break t)
   )
 )
)