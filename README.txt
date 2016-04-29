= Notebook [@version@] Release Notes =

Start Notebook and select "Topics" from the "Help" menu for
documentation on how to use Notebook.

The Notebook home page is at http://notebook.wjduquette.com

This version of Notebook is fully usable; I use it myself, daily.
However, it contains a number of experimental and undocumented 
features, and should be considered a work in progress.  Some of
the undocumented features might be changed, removed, or replaced
in the next version.

Meanwhile, though I'm not aware of any bugs it's likely some
are lurking; and there are many features and enhancements I've not
gotten to yet.  Please don't be shy about telling me about problems
you have or features you'd like to see.  You can send me
information by e-mailing me at will@wjduquette.com; or, better yet,
post at them at the Notebook home page (see above).  Also, 
you might want to join the Notebook Mailing List so you'll see
the announcements of new releases.  (Again, see the Notebook
home page).

== Installation ==

This version of Notebook is delivered as an executable for 
Windows systems, as a native executable for Mac OS X systems 
(10.3 or later) and as a Starkit for all other systems.  To use 
Notebook on a Windows system, just execute notebook.exe.  You
might wish to associate it with the ".nbk" file type.  To use
Notebook on Mac OS X, just drag the Notebook application to your
application folder.

For other systems, you'll need to download "notebook.kit" and 
the TclKit runtime for your platform from
http://www.equi4.com/pub/tk/8.4.9.  Put the TclKit runtime on
your path, and mark notebook.kit executable.

If you have any questions, bug reports, suggestions, or comments,
feel free to contact me, Will Duquette, at will@wjduquette.com,
or post them at the Notebook Wiki, http://notebook.wjduquette.com.

== Changes in Version 2.1.3 ==

* MacOSX: New application and document icons.  Thanks to
  Kevin Walzer for pointing the way!
* New feature: the [Index Sidebar].  The page index
  and search results are now shown in a sidebar on the right hand side
  of the window.
** The page index, the search box, and the search results are now
  available all of the time, even while editing pages.
** The Search and Recent Changes pages are no longer required.  
   They will no longer be included in new notebooks, and may 
   safely be deleted from old notebooks.  Note that if you use
   such a notebook file with an older version of Notebook, the 
   Search and Recent Changes pages will be recreated
   automatically.
** The <m>goto-index</m> and <m>goto-recent-changes</m> 
   [User Interface Actions] are now deprecated.
** You can now search just page titles, or (the default) both page
   titles and content.
** Presenting the search results in the Sidebar is '''much''' faster
   than the older method; hence, incremental search is now the
   default.
** The Next Page/Previous Page keys (Control-N, Control-P) now work
   with the Sidebar's list.  You can now step through pages
   alphabetically or in time order from most recent to least recent,
   and you can step through all pages or the current search results.
** New [Sidebar Menu]

* Reorganized the [Page Menu] for quicker access
  to the most common choices.

* Keyboard access to the [Search Box].
** The [find-string] action now works through the 
   [Search Box].

* New menu item: '''Page / Delete Pages...'''
** This menu item will delete the set of pages selected in the
   [Index Sidebar] (first prompting for confirmation).   

* New [Miscellaneous Preferences]:
** The sidebar may be open or closed in new windows by default.
** Search may be incremental or non-incremental by
   default. 
** Search may be by page title only or by both page title
   and content by default.

* Notebook now scrolls large images much better
  than it used to. Thanks to Wayne Mogg for coming up with the fix!
  As a side-effect, the image "-padheight" option has been removed.

* New Actions/Notebook Commands:
** delete-pages
** searchtext
** show-index
** show-recent
** sidebar
** sidebar-byname
** sidebar-bytime
** sidebar-close
** sidebar-open

* Bug Fix: Excess whitespace is no longer removed in link and
  magic button text.

* Bug Fix: Notebook's keyboard shortcuts now work properly whether
  CapsLock is enabled or not.

* Bug Fix: "-" markup for explicit line breaks.  I added this markup
  in V2.1.1, and then took it out again in V2.1.2 in favor of
  &lt;br&gt;.  However, I only took out half of the code, so that
  "-" still caused a line/paragraph break, but also appeared in the
  output.  Enough people have spoken in favor of "-", though, that
  I reinstated it rather than removing it completely.

* Bug Fix: When invoked from the command line, Notebook can now open
  multiple notebooks at the same time, as it is suppose to do.

* Bug Fix: Notebook's fonts are oddly sized on some systems.  You can
  now fix this by adjusting the "Tk Scaling Factor" on the 
  [Scaling Preferences] tab of the [User Preferences] window.

* Newly Deprecated:
** goto-index
** goto-recent-changes

* The implementation of browser-specific Notebook Commands has 
  been extensively revised.  The new code is simpler, shorter, and
  should be easier to maintain; it's also the first step toward 
  securing the User Code interpreter such that you can load Notebooks
  from unknown sources without worrying about what their User Code
  might do to your system.
** As a result, the "browser" Notebook Command is no longer needed.
   Because it does represent a security hole, and should never have
   been used directly by User Code anyway, it has been deleted 
   rather than deprecated.  If you were using "browser" directly
   for some reason, contact me and I'll see if I can provide an
   alternate mechanism.

* The following Notebook commands were deprecated in Notebook 2.0.1
  and have now been deleted from the application
** backpage
** editpage
** editnewpage
** includecode
** message
** renamepage
** showhelp
** shownext
** showpage
** showprev

== Changes in Version 2.1.2 ==

* New Feature: Inline Images!  Include images in
  your Notebook pages using the new markup:

: <m>&lb;!image path/to/file ?<i>options...</i>?!&rb;</m>

  By default, Notebook understands only GIF images; with the
  optional [TkImg Extension] you also get BMP, JPEG, PNG, and
  TIFF files.  (See the on-line help for more information about
  getting the [TkImg Extension].)  Note that the Mac OS X
  version of Notebook already includes the [TkImg Extension].

* New Notebook Command: <m>html</m>.  Allows
  you to control how Notebook exports HTML; in particular, allows
  you to define CSS (Cascading Style Sheet) styles.  '''Note:'''
  this command is experimental; it is likely to change in the
  next version.  It's not documented, but you can take a look at
  the [User Code] page of this on-line help for an example.

* New Markup: &lt;br&gt; for explicit line breaks.  The "-" markup I
  introduced in 2.1.1 has been removed; I can add it back in
  if folks like it.

* New Markup: #rem directive.  "rem" stands for "remark"; #rem
  directives are used to add comments to Notebook pages.  #rem
  directives are not displayed or exported (unless all directives
  are displayed).

* Bug fix: Notebook export to HTML no longer fails if two Notebook
  pages clash.

* Bug fix: #meta directives were displayed as preformatted text in
  pages converted to HTML or MediaWiki markup.

* Bug fix: MediaWiki export no longer misformats bulleted paragraphs.

* Bug fix: Notebooks created without the Tour are now loaded
  successfully.

* Bug fix: Explicit line breaks are now formatted properly on HTML
  export -- provided you use the new <br> markup instead of the "-"
  markup.

* Bug fix: Selection of specially formatted text (e.g., #pre and 
  #Tcl) is now visible.  (Thanks to Vsu for pointing out the fix!)

* Bug fix: In HTML export, headers now close indentation properly.

* Bug fix: In HTML export, "<", ">", and "&" are now escaped 
  properly in headers.

* Bug fix: Links to non-existent pages are now highlighted when
  the Notebook is exported to HTML.

== Changes in Version 2.1.1 ==

* New splash screen.  The splash screen image was donated
  by Tomek Wojtowicz.

* The on-line help now contains documentation for many changes
  made but not documented in 2.1.0.  The relevant changes are listed
  under "Changes in Version 2.1.0" and are marked "Documented in
  2.1.1".

* New Feature: Export the entire notebook to HTML!  
  The output is still rather basic, but it's a start.  There are two 
  new menu items:
** File/Export/As Single HTML File...
** File/Export/As Set of HTML Files...

* The [User Code] page in the on-line help shows how to use the
  #Tcl/#unTcl directives to better document your Tcl code.

* The Preferences dialog is now a normal toplevel window instead
  of a dialog.

* Added "User Interface Actions" to the Help menu.

* New Preference: Create new pages silently on link click.  Normally,
  if you click on a link to a page that doesn't exist then Notebook
  will ask you if want to create it.  If you check this box on the
  Miscellaneous tab of the Preferences window, Notebook will take you
  straight to the page editor instead.

* New Feature: the status line's prompt now has a yellow background
  when it's waiting for you to answer a question or enter some input;
  this should make it easier for new users to spot.

* New Preference: A long time ago, I made Notebook default to
  putting the cursor at the end of the page when you edit a page,
  because I was tired of moving the cursor there manually.  Since
  then, I've gotten tired of moving the cursor to the beginning of the
  page manually.  So I've changed the behavior to default to leaving
  the cursor at the beginning of the edited page.  If you prefer the
  old behavior, there's a new option on the Miscellaneous tab of the
  Preferences window.

* New Preferences: you can now specify foreground and background
  colors for preformatted text and Tcl code on the Colors tab
  of the Preferences window.

* New Preference: you can turn display of "#" 
  directives on and off.  It is now off by default.

* New Feature: Whenever search text is entered in
  the search entry field at the top of the page browser, any matching
  text in the browsed page will be highlighted.  You may select the
  highlight colors you prefer on the Colors tab of the Preferences
  window.

* New Markup: Explicit line breaks.  If a line begins with "-", 
  Notebook will always cause it to begin on a new line.  The "-" and 
  any subsequent whitespace are not displayed.

* New Markup: Multi-level section headers.  Notebook now
  allows three levels of header in a page:

  = Level 1 =
  == Level 2 ==
  === Level 3 ===

: The first "=" character must be at the beginning of the line, and
  the header text must be separated from the "=" characters by at
  least one space.  The final "=" must be the last thing on the line.
  If any of these constraints are not met, the header will be
  formatted as normal text, "=" characters and all.

* New Markup: Wiki-like markup for bold and italic text:

  ''Italic''
  '''Bold'''
  '''''Bold and Italic'''''

* New Preference: Fonts for header levels 1, 2,
  and 3.  Note that the in-line header markup, 
  "&lt;h&gt;...&lt;/h&gt;", is displayed in the level 3 header font.

: If you've used prior versions of Notebook, all three header fonts
  will be set to the single header font you'd chosen previously.  Use
  the Preferences window to select the specific fonts you'd like.

* New Export Format: MediaWiki Markup.

* New Notebook Commands:
** [codeget]
** [copy-page-as]
** [copy-this-page-as]
** [export-page-as]
** [export-this-page-as]
** [help-on-actions]

* New User Interface Actions:
** [help-on-actions]
** [copy-page-as-mediawiki]
** [copy-this-page-as-mediawiki]
** [export-page-as-mediawiki]
** [export-this-page-as-mediawiki]
** [export-notebook-as-html-file]
** [export-notebook-as-html-set]

* Updated Command: [current]
** The [current] command now allows embedded macros to know the page
   in which they are embedded, as well as the page in which they will
   be displayed.  This is useful when writing code that builds up a
   page (like a Daily Log) from other pages.

* Bug Fix: On OS X with Tcl/Tk Aqua, having a tooltip pop up for a
  toolbar button should no longer cause the Notebook window to
  lose focus.

== Changes in Version 2.1.0 ==

* New Markup: You can have a page link whose link text differs
  from the page name.  For example, you can link to your "Home"
  page as "My Home Page" using the following markup:

   [My Home Page|Home]

* Support for international fonts.  This version of Notebook
  includes all of Tcl's Unicode encodings, and should therefore
  support a variety of character sets, including Chinese.

* New Feature: Magic/Load This Page will load
  the Tcl code from the current page even if you're currently editing
  the page.  In this case it will save your edits before loading the
  the code; you'll remain in the editor.  <i>Documented in 2.1.1</i>

* New Feature: Notebook now supports the #unpre directive, which
  allows multiple #pre/#unpre blocks of preformatted text on a page.

* New Feature: Notebook now supports the #unTcl directive. #Tcl/#unTcl
  work like #pre and #unpre, but bracket Tcl code instead instead of
  preformatted text.  User Code pages can now have multiple blocks of
  Tcl code interspersed with normal prose.

* New Feature: Edit/Copy Page submenu.  The
  items on this menu copy a page's content to the clipboard as
  plain formatted text, raw markup, markup with macros expanded, 
  HTML body text, or as a complete HTML page. <i>Documented in 2.1.1</i>

* New Feature: Page/Export submenu.  The items on
  this menu export a page's content to a text file as plain formatted
  text, raw markup, markup with macros expanded, HTML body text, or as
  a complete HTML page.  <i>Documented in 2.1.1</i>

* New Markup: &lt;html&gt;...&lt;/html&gt; <i>Documented in 2.1.1</i>
** Use these tags within a paragraph to mark text that should be
   exported to an HTML page "as is", e.g., text that already
   contains HTML markup.

* New Markup: #meta directive  <i>Documented in 2.1.1</i>

* New Markup: #data .. #undata   <i>Documented in 2.1.1</i>
** These directives are used to bracket arbitrary textual data just
   as #pre and #unpre bracket preformatted text.  The #data directive
   includes the data type name, which will allow for additional 
   processing.
** The contents of a data block are (at present) displayed as
   preformatted text.
** The only "data type" recognized by Notebook in any way at
   this time is "html"; on export to HTML, the contents of an
   "html" data block is exported as is.

* New User Interface Actions.  <i>Documented in 2.1.1</i>
** [copy-page-as-plain-text]
** [copy-page-as-raw-markup]
** [copy-page-as-expanded-markup]
** [copy-page-as-html-page]
** [copy-page-as-html-text]
** [copy-this-page-as-plain-text]
** [copy-this-page-as-raw-markup]
** [copy-this-page-as-expanded-markup]
** [copy-this-page-as-html-page]
** [copy-this-page-as-html-text]
** [export-page-as-plain-text]
** [export-page-as-raw-markup]
** [export-page-as-expanded-markup]
** [export-page-as-html-page]
** [export-page-as-html-text]
** [export-this-page-as-plain-text]
** [export-this-page-as-raw-markup]
** [export-this-page-as-expanded-markup]
** [export-this-page-as-html-page]
** [export-this-page-as-html-text]

* New Notebook Commands.  <i>Documented in V2.1.1</i>
** [exportformat]
** [formatas]
** [savefile]
** [getsavefile]
** [parse]

* Bug fix: Selecting File/Close Window from the Message Log window
  now closes the window as expected.

* Bug fix: Selecting "Cancel" from the Open Notebook or New Notebook
  dialogs no longer causes Notebook to halt.  (This only happened if
  open-notebook or new-notebook were invoked from the Welcome window.)

* Bug fix: If load-page finds an error in the loaded page, the error
  is now written to the status line and the Message Log window.

* Bug fix: You can now rename page "Fred" to "x-Fred" without error,
  and you can now delete "Fred" without deleting "x-Fred" as well.

* Bug fix: Pressing the "Save and Continue Editing" button in the
  Page Editor no longer causes other open Notebook browsers to pop
  up or take the focus unexpectedly.

* Bug fix: Previously, if you edited a page and then immediately
  tried to find a string on that page, the search always failed because
  the cursor was at the bottom of the page.  In this case, Notebook
  now starts searching from the top of the page, as you'd expect.

* Bug fix: In the page browser, the behavior of the Home and End keys 
  was erratic.  Home now scrolls to the top of the page and End to
  bottom, as expected.

* Bug fix: Previously, pasting text into the page editor could leave
  the insertion point off-screen.  The page editor now scrolls as
  necessary after each paste.


