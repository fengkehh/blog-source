# Set the English locale for the `date` command.
export LC_TIME=en_US.UTF-8

# The commit message.
MESSAGE="Site rebuild $(date)"

msg() {
    printf "\033[1;32m :: %s\n\033[0m" "$1"
}

msg "Removing the old website"
pushd public
git rm -rf *
popd

msg "Pushing the updated \`public\` folder to the \`master\` branch"
pushd public
git add *
git commit -m "$MESSAGE"
git push
popd