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
        unlink(list.files(path = './public', full.names = TRUE), recursive = TRUE)
        setwd('..')
        
        # Build website from source
        build_site()
        
        # Push site
        message <- paste('Site rebuild', as.character(Sys.time()))
        setwd('./public')
        
        fileConn<-file("deploy.sh")
        writeLines(c('git add -A',
                     paste('git commit -m', ' \"', message, '\"', sep = ''), 
                     'git push'), 
                   fileConn)
        close(fileConn)
        
        setwd('..')
        print(message)
        print('Go to ./public and execute ./deploy.sh')
        
    }
    
}