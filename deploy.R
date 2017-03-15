## Customized R function to facilitate fast site deployment
require(blogdown)

deploy <- function() {
    
    # Make sure things are commited
    output <- system('git status -s', intern = TRUE)
    
    if (length(output)) {
        print('Dirty work directory. Commit/revert changed files first.')
    } else {
        # Remove old website
        system('cd public')
        system('rm -rf *')
        system ('cd ..')
        
        # Build website from source
        build_site()
        
        # call deploy shell script to push site
        system('./deploy.sh')
        
        print('Site built and deployed.')
        
    }
    
}