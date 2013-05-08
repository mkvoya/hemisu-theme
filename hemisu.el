;;; Code:
(defun create-hemisu-theme (variant theme-name &optional childtheme)
  (let* (
	 (black              "#000000")
	 (white              "#FFFFFF")
	 (almost-white       "#EEEEEE")
	 (almost-black       "#111111")
	 (middle-dark-grey   "#777777")
	 (middle-light-grey  "#999999")
	 (light-grey         "#BBBBBB")
	 (dark-grey          "#444444")

	 (red                "#D65E76")
	 (middle-dark-pink   "#FF0055")
	 (middle-light-pink  "#D65E76")
	 (light-pink         "#FFAFAF")

	 (dark-blue          "#005F87")
	 (middle-dark-blue   "#538192")
	 (middle-light-blue  "#9FD3E6")
	 (light-blue         "#CBE4EE")

	 (dark-green         "#5F5F00")
	 (middle-dark-green  "#739200")
	 (middle-light-green "#B1D631")
	 (light-green        "#BBFFAA")

	 (dark-tan           "#503D15")
	 (light-tan          "#ECE1C8")

	 (bg          (if (eq variant 'light) white             black))
	 (norm        (if (eq variant 'light) almost-black      almost-white))
	 (comment     (if (eq variant 'light) middle-light-grey middle-dark-grey))
	 (dimmed      (if (eq variant 'light) middle-dark-grey  middle-light-grey))
	 (subtle      (if (eq variant 'light) light-grey        dark-grey))
	 (faint       (if (eq variant 'light) almost-white      almost-black))
	 (accent1     (if (eq variant 'light) middle-dark-blue  middle-light-blue))
	 (accent2     (if (eq variant 'light) middle-dark-green middle-light-green))
	 (accent3     (if (eq variant 'light) middle-dark-pink  light-green))
	 (accent4     (if (eq variant 'light) dark-tan          light-tan))
	 (norm-red    (if (eq variant 'light) middle-dark-pink  middle-light-pink))
	 (norm-green  (if (eq variant 'light) middle-dark-green middle-light-green))
	 (norm-blue   (if (eq variant 'light) middle-dark-blue  middle-light-blue))
	 (faint-red   (if (eq variant 'light) red               red))
	 (faint-green (if (eq variant 'light) light-green       dark-green))
	 (faint-blue  (if (eq variant 'light) light-blue        dark-blue)))

    (custom-theme-set-faces
     theme-name
     '(button ((t (:underline t))))

     `(cursor                       ((t (:background ,accent3 :foreground ,bg))))
     `(default                      ((t (:background ,bg      :foreground ,norm))))
     `(region                       ((t (:background ,faint-blue))))
     `(font-lock-constant-face      ((t (:foreground ,accent1))))
     `(font-lock-comment-face       ((t (:foreground ,comment))))
     `(font-lock-string-face        ((t (:foreground ,accent2))))
     `(font-lock-keyword-face       ((t (:foreground ,accent3))))
     `(font-lock-type-face          ((t (:foreground ,accent1))))
     `(font-lock-builtin-face       ((t (:foreground ,accent3))))
     `(font-lock-function-name-face ((t (:foreground ,norm))))
     `(font-lock-variable-name-face ((t (:foreground ,accent2))))
     `(font-lock-preprocessor-face  ((t (:foreground ,accent2))))

     `(vertical-border              ((nil (:foreground ,subtle))))
     `(header-line                  ((t (:background "#000000"))))
     `(mode-line ((t (:background ,accent2 :foreground ,bg :box nil))))
     `(mode-line-inactive ((t (:background ,subtle :foreground ,bg :box nil)))))


    (custom-theme-set-variables
     theme-name
     ;; fill-column-indicator
     `(fci-rule-color ,subtle))

    ;; call chained theme function
    (when childtheme (funcall childtheme))))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;; Local Variables:
;; no-byte-compile: t
;; End:

(provide 'hemisu)

;;; hemisu.el ends here
