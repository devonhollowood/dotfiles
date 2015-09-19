#!/usr/bin/python
'''Short script to add git functionality to tmux'''

from git import Repo, InvalidGitRepositoryError, NoSuchPathError
from os import environ

def tmux_git_status(directory):
    '''Returns info about `directory`, formatted for tmux'''
    try:
        repo = Repo(directory, search_parent_directories=True)
        branch = '<bare>' if repo.bare else repo.active_branch
        if repo.is_dirty():
            branch = '~{}~'.format(branch)
        return '[git-branch: {}] '.format(branch)
    except (InvalidGitRepositoryError, NoSuchPathError):
        return ''

if __name__ == '__main__':
    print tmux_git_status(environ.get('TMUX_PATH'))
