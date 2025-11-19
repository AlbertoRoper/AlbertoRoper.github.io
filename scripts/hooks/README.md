Install pre-receive hook to enforce linear history (no merge commits)

1. Copy files to the bare repository on your private Git server:
   - scripts/hooks/pre-receive -> /path/to/bare-repo.git/hooks/pre-receive
   - scripts/hooks/README.md -> /path/to/bare-repo.git/hooks/README.md

2. Make the hook executable:
   chmod +x /path/to/bare-repo.git/hooks/pre-receive

3. Test locally by attempting to push a branch that contains a merge commit (it should be rejected).

Notes:
- This hook disallows merge commits (commits with more than one parent). It enforces a linear history by rejecting pushes that would introduce merges.
- Users should rebase their branches instead of merging locally before pushing. Use `git rebase` and `git push --force-with-lease` when necessary.
- If you mirror this private repo to GitHub, GitHub will reflect the protected linear history (it will reject forced pushes if branch protection is enabled).

SVN mirroring:
- If you mirror from SVN to this Git server, ensure the mirroring process creates linear commits (no merges) or runs through a staging repo that normalizes history.
- If the SVN-to-Git bridge generates merge commits, consider transforming the commits (e.g., using git-filter-repo) before pushing into the protected repo.

Advanced:
- You can extend the hook to allow specific users to push merges (check $GIT_AUTHOR_NAME or SSH key), or to allow merge commits on specific branches only.
- The hook currently checks for any commits in the pushed range with >=2 parents. If you need finer control (e.g., allow merges from an integration branch), we can adapt it per your policy.
