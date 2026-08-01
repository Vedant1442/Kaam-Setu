# 🚀 Team Commit Guide — KaamSetu Hackathon

Read this. Follow it. Don't skip steps.

---

## Why This Exists

We need our GitHub to look like an actual team project. Right now only Vedant has commits. Judges WILL check the repo. We need all 4 of us contributing.

---

## Step 1: Clone & Setup (do once)

```bash
git clone https://github.com/Vedant1442/Kaam-Setu.git
cd Kaam-Setu
git checkout 1-august-Vedant-
```

---

## Step 2: Make 4-5 Commits Each

Pick from the tasks assigned to you below. If you finish early, make up your own small ones — typo fixes, style tweaks, adding comments, anything.

Commit format: `type: short message`

Types you can use:
- `fix:` — something was broken or wrong
- `feat:` — new small thing added
- `docs:` — documentation changes
- `style:` — CSS/styling/color tweaks
- `chore:` — config, setup, housekeeping stuff
- `refactor:` — cleaned up code without changing behavior

### 👤 Person A — [NAME]

| # | Commit Message |
|---|---------------|
| 1 | `fix: corrected phone number validation regex` |
| 2 | `feat: added loading spinner to login screen` |
| 3 | `chore: added .env.example with sample config` |
| 4 | `docs: added team member names in README` |
| 5 | `style: adjusted padding on job cards` |

### 👤 Person B — [NAME]

| # | Commit Message |
|---|---------------|
| 1 | `fix: fixed navigation back button on profile` |
| 2 | `feat: added pull to refresh on job feed` |
| 3 | `chore: updated android manifest permissions` |
| 4 | `docs: added setup instructions to README` |
| 5 | `style: fixed color contrast on dark theme` |

### 👤 Person C — [NAME]

| # | Commit Message |
|---|---------------|
| 1 | `fix: fixed OTP auto-read issue` |
| 2 | `feat: added skill tags on worker profile` |
| 3 | `chore: added flutter analyze ignore rules` |
| 4 | `test: added basic widget test for login` |
| 5 | `refactor: extracted reusable button widget` |

---

## Step 3: Push Your Commits

After each commit, push it:

```bash
git add -A
git commit -m "your message here"
git push origin 1-august-Vedant-
```

**IMPORTANT:** Your GitHub email MUST be linked to the Vedant1442/Kaam-Setu repo's contributors. If your commits show as a gray silhouette, your email isn't on your GitHub account.

Check: go to github.com → Settings → Emails → make sure your email is added and verified.

---

## Rules — READ THESE

1. **Don't touch other people's commits.** Only add new ones.
2. **Don't force push.** Ever. (`git push --force` = disaster)
3. **Don't merge or rebase.** Just commit and push.
4. **Keep commits small.** One tiny change per commit. Not a big dump.
5. **Spread commits over days.** Don't do all 5 at once. Do 1-2 per day.
6. **Use your own laptop.** So the git config shows YOUR name.

---

## Quick Git Commands Cheat Sheet

```bash
# check what branch you're on
git branch

# see recent commits
git log --oneline -10

# see what files changed
git status

# stage and commit
git add -A
git commit -m "your message"

# push
git push origin 1-august-Vedant-

# if something goes wrong, DON'T PANIC — ask Vedant before doing anything
```

---

## What Judges Look At

| They check | What they want to see |
|-----------|----------------------|
| GitHub profile | Multiple contributors, green squares |
| Commit history | Natural looking, spread over days |
| Code quality | Clean structure, not messy |
| Working demo | App actually runs and looks good |

**The working app matters 100x more than commit history.** But having 4 contributors on the repo makes us look legit.

---

## Timeline

| When | Who | What |
|------|-----|------|
| Today | Everyone | Clone, make first 2 commits |
| Tomorrow | Everyone | Make 1-2 more commits |
| Day before hackathon | Everyone | Final commits, push everything |
| Hackathon day | Vedant | Present the app |

---

Questions? Ask Vedant. Don't experiment with git commands you don't understand.
