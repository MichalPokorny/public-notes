My public notes.

License: GPL 3

Goals
==

* Short-term note-taking.
* Store all information I need long-term.
* Diary writing.
* Store the history of what I learned and when.

High-level overview
==

* Notes are stored in Git, which means I can delete anything I no longer think
  I'll ever need, without worrying about losing it.
* I have Dropbox mounted in `/home/prvak/dropbox/`. (It's actually a symlink
  into an encrypted partition.)
* Private notes Git: in `/home/prvak/dropbox/notes`. No remote - history is
  stored in Dropbox.
* Public notes Git: <https://github.com/MichalPokorny/public-notes>.
  Checked out in `/home/prvak/repos/public-notes`.
  The repo is symlinked in `/home/prvak/dropbox/notes/public`.
* `/home/prvak/notes` is a symlink into `/home/prvak/dropbox/notes`.

Short-term note-taking
==

* Short-term notes and TODOs are stored in `NOTES.txt`.
* `Win-Shift-N` brings up a prompt to quickly add a one-liner note.
* `notes` is aliased in `.zshrc` to `vim /home/prvak/dropbox/notes/NOTES.txt`.

Longer-term note-taking
==

Structured:

* `do`: Things I want to do because they're useful.
* `fun`: Things I want to do because they're fun.
* `learn`: Things I want to learn.
* `read`: Things I want to read.
* `wishlist`: Things I want.

TODO: Think about structure a bit more.

* When I watch a movie, I review it on IMDB.
* When I read a book, I review it on Goodreads.
* I store my music, including music I want to check out, in Spotify.

Things to remember
==

I use Anki flash cards to memorize things. When I add something as
an Anki note, I delete all other representations of it.

* The data for the decks is stored in
  <https://github.com/MichalPokorny/anki-decks>.
* The notes are stored in the `notes` subdirectory.
* The repository contains `create_decks.py`, which imports the human-readable
  YAML files into Anki.
* The Anki database is synced to the YAML files by card UUIDs.
* The repository is checked out in `/home/prvak/repos/anki-decks`.
* `/home/prvak/notes/anki-public` is a symlink to
  `/home/prvak/repos/anki-decks/notes`.
