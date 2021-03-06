### What is it?

Seewald Notes is a structured, modal notation for transcribing one's learning process.  It is so named because it was developed by and will probably only be used by Alex Seewald, but it is wonderful you are reading this document! Because many people effectively write notes in an informal manner, one might wonder why to bother with a standard structure?  Seewald Notes borrows from a richer set of influences than the english language and identifies the current mode of communication for the sake of clarity. This act applies the idea of data-types to one's own thoughts. Also, there is a vim plugin that defines a set of macros and syntax-highlighting that makes those static types visually evident and convenient to type.

Like how the written English language uses single quotes to reference a phrase rather than use a phrase, Seewald Notes uses a number of sigils to denote modes.  This is done under the expectation that identifying the context of an expressed thought will lead to clarity of thinking.

Since thoughts lead to other thoughts, the tree data type is a model for certain kinds of cognition. A Seewald Notes filename is the name of root of a subtree and each indentation level is a tree-depth level. Because, in a tree, any node can be considered the root of a subtree, a Seewald Notes file could be a child of a Seewald Notes directory. In this way, the presence of a Seewald Notes file in the filesystem can have conceptual meaning.

### The Alluded-to Types

- The parent-child relationship is denoted by a ':' at the end of the parent content and the indentation of the child.
- Lines which start with a '\*' are distinct children of a subtree. Lines starting without the '\*' contain content which applies to that subtree in general and do not have that sense of itemness.
- `` ''` ' `` enclose a region where the content is being refered to, not 'used' by the author in the default prose way. In a polymorphic way, this mode is also used to reference SeewaldNotes nodes, urls, or something similar.
- `` `# ... #' `` enclose a region where the content is notably more subjective than the rest of the text.
- `` `? ... ?' `` enclose a region with a question that the author intends to return to, as opposed to a region of text where the question IS the point.
- `` `! ... !' `` enclose a region with the answer to a preceding `` `?...?' `` style question.
- `` `~ ... ~' `` enclose a region with domain-specific jargon.
- `` `` ... '' `` enclose psuedocode, or interpretable code.
- `` `/ ... /' `` enclose a BNF-style definitions, or regex-style patterns, or some similar computer science concept applied in a literal or figurative way.

### Special Symbols
- '%' means 'the current file'
- '@' is the prefix to a SeewaldNotes reference like " to find the original pictures, see `@%.sources.images' "

### Installing the Vim Plugin
```
$ cp tools/swd_detect.vim ~/.vim/ftdetect/
$ cp tools/SeewaldNotes.vim ~/.vim/ftplugin/
```

### Issues
The syntax highlighting feels buggy in terminal vim, but not in the MacVim application.

### Closing Thoughts

A reader of a similar culture to I might recognize influences of BNF, Latex, the Spanish language, and Python. Because thinking is such a broad act, a diversity of influences rather than a purity of influences is beneficial.

See selfReferentialExplanation.swd for a more in-depth explanation of Seewald Notes that is itself a Seewald Notes document.
