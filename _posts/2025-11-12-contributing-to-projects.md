---
layout: post
title: Contributing to developments of collaborative projects using CosmoGW organization
# cover-img: /assets/img/pc_school_background.png
# thumbnail-img: /assets/img/pc_logo.png
# share-img: /assets/img/pc_logo.png
tags: [coding]
author: Alberto Roper Pol
---

In order to contribute to collaborative projects like [CosmoGW](https://github.com/CosmoGW/CosmoGW), I recommend the following procedure to my collaborators.

{: .box-note}
**Note:** If you are interested in becoming a developer of CosmoGW, contact me at my email [alberto.roperpol@unige.ch](emailto:alberto.roperpol@unige.ch).

### Creating a repository to work publicly or privately on your modifications

{: .box-note}
**Note:** If you are already a member of the `CosmoGW_developments` team, you do not need to follow these steps to make private modifications to `CosmoGW`.

1. ***Create a repository (public or private) where you (and your collaborators) can work on modifications***

In first place, create a new empty repository (public or private) under the organization, where you will make updates. For this example, we will name the repository `test`

```bash
git clone https://USERNAME@github.com/CosmoGW/test.git
```

{: .box-note}
**Note:** Change USERNAME by your registered username in the CosmoGW organization

2. ***Fetch and rebase the public repo CosmoGW to your repo***

Once you have cloned the new repository, add the original public repo CosmoGW as remote to fetch future changes. This will allow you to periodically pull new changes made in the public CosmoGW repo.

```bash
git remote add upstream https://USERNAME@github.com/CosmoGW/CosmoGW.git
```

You can list your remotes with `git remote -v`

```bash
git remote -v
```

You should see the following:
```bash
origin  https://USERNAME@github.com/CosmoGW/test.git (fetch)
origin  https://USERNAME@github.com/CosmoGW/test.git (push)
upstream        https://USERNAME@github.com/CosmoGW/CosmoGW.git (fetch)
upstream        https://USERNAME@github.com/CosmoGW/CosmoGW.git (push)
```

Whenever you want to pull changes from the upstream (public CosmoGW repo), you need to fetch and rebase in the following way
```bash
git fetch upstream
git rebase upstream/main
```

If there are no conflicts, this will automatically update your local copy with the public repo.

{: .box-warning}
**Warning**: To avoid any conflicts, do not create a README.md file in your empty repo, just keep it empty!

If there are conflicts in some of the files, you will see a CONFLICT error. To fix the conflicts, go to each file and fix them by modifying the corresponding files.

{: .box-note}
**Note:** Make sure you get rid of all `>>>` and `"""` in the files while resolving the conflicts.

Once you have modified your files to solve the conflict, you should
```bash
git add FILE
git rebase --continue
```
for each FILE for which you have fixed conflicts. You might need to repeat this process one more time and then you will get the following message
```bash
Successfully rebased and updated refs/heads/main.
```
3. ***Push your local repo to the remote repo***

Once you have rebased, then you need to push to origin, which corresponds to your remote version `test` (public or private) where you can freely work on your modifications.

```bash
git push
```

If you are working alone in the repo, the recommended is to just modify the main branch, while if you are working with other people in your own repo you should use development branches and create a pull request.