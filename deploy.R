## Customized R function to facilitate fast site deployment
require(blogdown)

deploy <- function() {
    
    # Make sure things are commited
    output <- system('git status -s', intern = TRUE)
    
    if (length(output)) {
        print('Dirty work directory. Commit/revert changed files first.')
    } else {
        # Remove old website
        setwd('./public')
        unlink(list.files(), recursive = TRUE)
        setwd('..')
        
        # Build website from source
        build_site()
        
        # Push site
        message <- paste('Site rebuild', as.character(Sys.time()))
        setwd('./public')
        system('git remote show origin')
        # system('git add -A')
        # system(paste('git commit -m', message))
        # system('git push')
        # setwd('..')
        print(message)
        
    }
    
}