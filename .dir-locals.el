;; THIS WORKS
;; ((nil . ((cmake-ide-build-dir . "/home/sov/CS/AlgoDS/skiplist"))))

;; now attempting to set up init configure
((nil . ((eval . (setq
                  ;; projectile-project-test-cmd #'helm-ctest
                  projectile-project-compilation-cmd #'helm-make-projectile
                  ;; projectile-project-compilation-dir "/home/ken/CS/AlgoDS/skiplist/build"
                  projectile-project-compilation-dir "build"
                  helm-make-build-dir (projectile-compilation-dir)
                  ;; helm-ctest-dir (projectile-compilation-dir)
                  ))
         (cmake-ide-build-dir . "/home/sov/CS/AlgoDS/skiplist/build")
         ;; (cmake-ide-build-dir . "")
         (projectile-project-name . "skiplist")
         (projectile-project-run-cmd . "./run.sh") ;; not working
         ;; (projectile-project-configure-cmd . "CXX='cc_args.py g++' cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=Yes -DCMAKE_BUILD_TYPE=DEBUG . && make")
         (helm-make-arguments . "-j2"))))

;; NOW I need to eval:
;;   projectile-configure-project
;;
;; also, compile-command : "make -k " might be useful to work-in cc_args

;; moved to .spacemacs
;; (setq-default flycheck-clang-language-standard "c++11")
