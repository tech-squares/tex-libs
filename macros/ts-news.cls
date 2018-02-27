% ts-news.cls - style for the Tech Squares newsletter
% Time-stamp: <2003-12-22 00:43:47 gildea>
% $Id: ts-jobs.cls,v 1.3 2003/09/18 03:38:33 gildea Exp $
% By Stephen Gildea, Dec 2003

\NeedsTeXFormat{LaTeX2e}[1995/12/01]    %for \LoadClassWithOptions

\ProvidesClass{ts-news}[2003/12/20 Tech Squares Newsletter]
\LoadClassWithOptions{article}          %load our base class

\RequirePackage{techlogo}               %also loads graphicx, which we need
\RequirePackage{url}
\RequirePackage{tsv}                    %tab-sep-values, by Stephen Gildea
\RequirePackage{rotating}

\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\textheight}{9.0in}

\setlength{\oddsidemargin}{0.25in}
\setlength{\textwidth}{6.0in}

%% no numbers on \section
\setcounter{secnumdepth}{0}

%% most parts are typeset two-column
\RequirePackage{multicol}
\setlength{\columnsep}{0.3in}           %the default is two small

% section titles: smaller fonts
\renewcommand{\section}{\@startsection {section}{1}{\z@}%
                                       {-3.5ex \@plus -5ex \@minus -.2ex}%
                                       {2.3ex \@plus.2ex}%
                                       {\normalfont\large\bfseries}}
\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
                                       {-3.25ex\@plus -1ex \@minus -.2ex}%
                                       {1.5ex \@plus .2ex}%
                                       {\normalfont\bfseries}}


% maketitle
% insert Tech Squares logo

\settechlogosize{1in}

\renewcommand{\@maketitle}{%
  \newpage
  \begin{center}%
  \techlogoline
  \vskip 2em
  \let \footnote \thanks
    {\LARGE\bf \@title \par}%
    \vskip 1.5em%
  \end{center}%
  \par
  \vskip 1.5em}

% Table of Contents

% title of the contents section
\renewcommand{\contentsname}{In This Issue}

% TODO maybe: put ToC in a light grey box.

\setcounter{tocdepth}{1}       %show only sections in ToC

% don't display page numbers in ToC
\renewcommand*\l@section[2]{%
  \noindent
  #1\par}

\newlength{\centerboxwidth}

% \centering in a \framebox
\newcommand{\centerinbox}[1]{%
  \par
  \vspace{\fboxsep}
  \setlength{\centerboxwidth}{\columnwidth}
  \addtolength{\centerboxwidth}{-2\fboxsep}
  \addtolength{\centerboxwidth}{-2\fboxrule}
  \noindent
  \fbox{%
    \begin{minipage}{\centerboxwidth}\centering
      #1\end{minipage}}
  \vspace{\fboxsep}\par}


% a list of names, to be typeset in two-columns
\newenvironment{classlist}
{\par\noindent
 \begin{minipage}{\columnwidth}
 \begin{multicols}{2}
 \setlength{\columnsep}{5pt}    %don't need much with raggedright
 \small                         %some names still don't fit
 \raggedright
 %% Indents names that go to 2 lines.
 %% Need this in an \everypar because of the \obeylines 
 \everypar{\setlength{\hangafter}{1}\setlength{\hangindent}{2em}}
 \obeylines}
{\end{multicols}
 \end{minipage}
 \par}

\newenvironment{duesform}
 {\par\setlength{\parindent}{0pt} \setlength{\parskip}{5pt}}
 {\par}

%% Blanks and formatting for dues form
\newsavebox{\blankbox}    \sbox{\blankbox}{\mbox{\rule{1.5cm}{0.4pt}\null}}
\newcommand{\blank}{\leavevmode\copy\blankbox}
\newlength{\blankwidth}   \setlength{\blankwidth}{\wd\blankbox}
\newsavebox{\shortblankbox}
   \sbox{\shortblankbox}{\mbox{\rule{0.5\blankwidth}{0.4pt}\null}}
\newcommand{\shortblank}{\leavevmode\copy\shortblankbox}

% this is mostly a 2-column tabular, but it also does \obeylines.
% Really, we just steal from Stephen Gildea's tsv style.
\newenvironment{credits}
 {\let\subsection\tsn@credits@subsection
  \par\noindent
  \begin{ttsv}{@{}ll@{}}}
 {\end{ttsv}\par}

% This faked-up \subsection lets us continue credits across subsections.
\def\tsn@credits@subsection#1{\rlap{\textbf{#1}}}

% the return address gets printed upside down
\newenvironment{returnaddress}
  {\setlength{\parindent}{0pt}
   \par
   \settechlogosize{0.3in}
   \begin{turn}{180}
   \begin{minipage}{\textwidth}}
  {\end{minipage}
   \end{turn}
   \par}



% ts-news.cls ends here
