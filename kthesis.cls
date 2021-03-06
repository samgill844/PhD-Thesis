%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                      %
%                           THESIS.STY                                 %
%                   Author: Douglas Miller                             %
%                           Computer Services Department               %
%                           Victoria College                           %
%                           BURWOOD 3125                               %
%                           Australia                                  %
%                           +61 (03) 805 3262                          %
%                           dougcc@viccol.edu.au                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%									%
%									%
%									%
%									%
%	This thesis style complies to the University of Keele		%
%	regulations							%
%									%
%	Example use:-							%
%									%
%									%
%	\documentstyle[keele]{kthesis}					%
%									%
%	\title{Place your\\title\\here}					%
%	\author{Name Here}						%
%	\qualifications{B.A. etc}					%
%	\degree{Doctor of Philosophy}					%
%	\school{Department of Computer Science}				%
%	\date{January 1990}	-	optional			%
%									%
%	\begin{document}						%
%									%
%	\prechapter{Abstract}	-	Optional, any number		%
%	This is placed on a page before the contents, numbered iii, etc	%
%	\chapter{Chap 1}						%
%	The same as for LaTeX styles, with section, subsection included	%
%	in the contents page						%
%									%
%	\appendix							%
%	\chapter{App 1}							%
%	The same as for LaTeX						%
%									%
%	\bibliographystyle{alpha}					%
%	\bibliography{mag_thesis}					%
%	\end{document}							%
%									%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\let\old@options=\@options
%\def\@options{\def\@ptsize{2}}  % Force article style to 12pt
%\input book.sty
\LoadClass[12pt]{book}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        SPECIAL COMMANDS FOR DEFINING FRONT MATERIAL OF THESIS        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\title#1{\def\@title{#1}}
\def\qualifications#1{\def\@qualifications{#1}}
\def\degree#1{\def\@degree{#1}}
\def\fulfilment#1{\def\@fulfilment{#1}}
\def\school#1{\def\@school{#1, \@institution}}
\def\abstract#1{\def\@abstract{
   {\vskip 3em plus 4em
   \bf Abstract
   \vskip1pt
   \footnotesize\parbox[t]{4in}{#1}}}}

\def\@abstract{}
\def\@fulfilment{total}

\def\maketitle{\par
 \begingroup
   \def\@oddhead{}%
   \def\thefootnote{\fnsymbol{footnote}}
   \def\@makefnmark{\hbox
       to 0pt{$^{\@thefnmark}$\hss}}
   \if@twocolumn
     \twocolumn[\@maketitle]
     \else \newpage
     \global\@topnum\z@        % Prevents figures from going at top of page.
     \@maketitle \fi
 \endgroup}

\newskip\abovetitleskip
\abovetitleskip=1.5in
\def\@maketitle{%\newpage
   %\vskip\abovetitleskip
   \vbox to 175mm{
   	  \vspace{2.6in}
      \begin{center}
         {\huge\bf\@title\par}
         \vspace{1.5 in}
         {\large\bf
            \lineskip .5em
            \begin{tabular}[t]{c}\@author\end{tabular}\\
            \@qualifications\par}
         \vspace{1.5in}
%         Submitted in \@fulfilment\ fulfilment of the requirements of the
%         degree of\\
         \@degree
         \vskip 0.5em
         \@school
         \vskip 1em
         \@date
         \@abstract
      \end{center}
      }
   }

\def\statement{%
   \temp@chapter*{Statement by Candidate}
   I hereby declare that this thesis contains no material which
   has been accepted for the award of any other degree or diploma in
   any university and that, to the best of my knowledge and belief, the
   thesis contains no material previously published by another person,
   except where due reference is made in the text of the thesis.
   \signed}

\def\signed{
   \begin{flushright}
   \begin{tabular}{rl}
   \\
   \\
   Signed: & \makebox[2in]{\dotfill}\\
           & (\@author)\\
   \\
   Date:   & \makebox[1.2in]{\dotfill}\\
   \end{tabular}
   \end{flushright}}


\let\olddocument=\document
\def\document{\olddocument\docinit}
\def\docinit{%
   \newdimen\origbaselineskip
   \origbaselineskip=\baselineskip
   \baselineskip=\Baselineskip
   \ex=\vfactor ex
   \divide\ex by 100
%
%<    \countdef\c@chapter=0 \c@chapter=0 % <- this was the original code
%<    \countdef\c@page=1 \c@page=1         <- here which caused problems
%
   \countdef\c@chapter=1 \c@chapter=0 % these have been swapped around so that
   \countdef\c@page=0 \c@page=1 %    page is in \count0 where dvips expects it
   \maketitle
   \pagenumbering{gobble} % No page number on the title page
   \newpage
   \mbox{}
   \newpage
   \pagenumbering{roman} % Start roman page numbers for the prechapters 
   \def\@oddhead{\hbox{}\hfil\sl\thepage}
%   \statement
   \newpage
   \setcounter{page}{1}
   \make@tableofcontents
   \global\def\thepart{\roman{part}} % Roman numeral part numbers.
   \global\def\thechapter       {\arabic{chapter}}
   \global\def\thesection       {\thechapter.\arabic{section}}
   \global\def\thesubsection    {\thesection.\arabic{subsection}}
   \global\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
   \global\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
   \global\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
   }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         TABLE OF CONTENTS                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\l@chapter#1#2{\smallskip\@dottedtocline{2}{0em}{2em}{{\bf #1}}{\bf #2}}%

\setcounter{tocdepth}{4}

\def\make@tableofcontents{\@tableofcontents}

\def\@tableofcontents{%
   {\baselineskip=\origbaselineskip\parindent=0pt
   \tableofcontents
   \listoffigures
   \listoftables}
   \cleardoublepage
   \c@page=1
   \global\def\thepage{\arabic{page}}}
% The following macros avoid printing a heading if there are no
% following lines (e.g., no tables, or no figures).

\let\old@contentsline=\contentsline

\def\tableofcontents{%
   \def\contentsline{\temp@chapter*{Contents}
   \let\contentsline=\old@contentsline\contentsline}%
   \@starttoc{toc}}

\def\listoftables{%
   \def\contentsline{\vspace*{-8pt}\temp@chapter*{List of Tables}
   \let\contentsline=\old@contentsline\contentsline}%
   \@starttoc{lot}}

\def\listoffigures{%
   \def\contentsline{\vspace*{-8pt}\temp@chapter*{List of Figures}
   \let\contentsline=\old@contentsline\contentsline}%
   \@starttoc{lof}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 S E C T I O N I N G    C O M M A N D S               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.  A section number will be printed if
%                 and only if LEVEL < or = the value of the secnumdepth
%                 counter.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.
%                 If negative, then paragraph indent of text following
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.

\setcounter{secnumdepth}{4}  % number four levels down

\font\slb cmbxsl10 scaled 1200       %  These fonts are used in kludge to
\font\slbfrtn cmbxsl10 scaled 1440   %  make slanted text bold in
\font\slbtwfv cmbxsl10 scaled 2490   %  headings.
\font\slbsvtn cmbxsl10 scaled 1730

\def\prechapter#1{\temp@chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\def\postchapter#1{\temp@chapter*{#1}\addcontentsline{toc}{chapter}{#1}}
\def\temp@chapter{%
   \newpage\global\@topnum\z@ % stop figure or table going at top of page
   \@startsection{chapter}{1}{\z@}%
%  {-9\ex}{3\ex plus 1\ex}{\huge\bf\def\sl{\slbtwfv}}}
   {-9\ex}{3\ex plus 1\ex}{\LARGE\bf\def\sl{\slbtwfv}}}
\def\@chapappp{}
\let\chapter=\temp@chapter
\def\section{\@startsection {section}{2}{\z@}{-3.5\ex plus -1\ex minus
  -.2\ex}{2.3\ex plus .2\ex}{\Large\bf\def\sl{\slbsvtn}}}
\def\subsection{\@startsection{subsection}{3}{\z@}{-3.25\ex plus -1\ex minus
  -.2\ex}{1.5\ex plus .2\ex}{\large\bf}}
\def\subsubsection{\@startsection{subsubsection}{4}{\z@}{-3.25\ex plus
   -1\ex minus -.2\ex}{1.5\ex plus .2\ex}{\normalsize\bf}}
\def\paragraph{\@startsection
     {paragraph}{5}{\z@}{3.25\ex plus 1\ex minus .2\ex}{-1em}{\normalsize\bf}}
\def\subparagraph{\@startsection
     {subparagraph}{6}{\parindent}{3.25\ex plus 1\ex minus
     .2\ex}{-1em}{\normalsize\bf}}

\def\theequation{\thechapter.\arabic{equation}}
\def\thefigure{\thechapter.\@arabic\c@figure}
\def\thetable{\thechapter.\@arabic\c@table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               STRUCTURAL TYPEFACE CHANGING COMMANDS               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\PN{\protect\changeface{\sl}} % Publication Name
\def\DT{\protect\changeface{\it}} % Definition of Term
\def\EM{\protect\changeface{\it}} % EMphasis
\def\NL{\protect\changeface{\it}} % Non-Literal text
\def\GR{\protect\changeface{\it}} % Greek text
\def\VT{\protect\changeface{\tt}} % Visual Terminal text
\def\vt{\protect\tt}

% Set the text #2 in the typeface #1.  The italic correction is inserted
% afterwards unless the next token is a comma, semicolon, or period.
\def\changeface#1#2{\begingroup#1{#2}\futurelet\ntok\@itcorr}
\def\@itcorr{\ifx\ntok.\else\ifx\ntok,\else\ifx\ntok;\else\/\fi\fi\fi\endgroup}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                           DISPLAYED MATERIAL                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\thebibliography#1{\chapter*{Bibliography}
  \list{}{\leftmargin=0pt}
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax}

%
% alternative bibliography environment to thebibliography
%
\def\biblist{\leftmargini=\parindent\def\bf{\sc}\baselineskip=\origbaselineskip
    \description
    \sloppy\sfcode`\.=1000\relax}
\def\endbiblist{\enddescription}

\def\quote{\list{}{\leftmargin=\parindent\rightmargin=\leftmargin}\small\item[]}

\def\fraction#1/#2{\(\frac{#1}{#2}\)}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         I N D E N T A T I O N                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\parindent 2.5em

\leftmargini 3.5em
\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         P A G E   L A Y O U T                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A4 = 297mm by 210mm

\voffset=0in
\hoffset=0in

\textwidth      = 130mm

\topmargin  =  0.6in
\headheight =  05mm
\headsep    =  13mm
\footskip   =  0mm
%\footheight =  0mm

\tolerance 300

\flushbottom

\def\thechaptertext{ }
\def\chaptermark#1{}
\let\@mkboth\markboth
\pagenumbering{roman}
\def\@oddfoot{}
\def\@oddhead{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     V E R T I C A L   S P A C I N G                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\parskip=0pt

\newskip\Baselineskip
\newskip\ex

\topskip=12pt

\def\adjustvfactor#1{\multiply #1 by \vfactor \divide #1 by 100}

\def\adjustvspacing{
   \adjustvfactor{\abovedisplayskip}
   \adjustvfactor{\parsep}
   \adjustvfactor{\topsep}
   \adjustvfactor{\partopsep}
   \adjustvfactor{\itemsep}
   \adjustvfactor{\floatsep}
   \adjustvfactor{\textfloatsep}
   \adjustvfactor{\intextsep}}
%   \adjustvfactor{\@maxsep}}

% HERE
\def\doublespaced{
%   \Baselineskip=24pt %  uncomment this for "double" spacing
    \Baselineskip=20pt % uncomment this for 1-3/4li spacing
%   \Baselineskip=18pt % uncomment this for 1-1/2li spacing
%    \Baselineskip=12pt % uncomment this for 1li spacing
   \textheight = \topskip
      \advance\textheight by 27\Baselineskip
   \def\vfactor{165}
   \adjustvspacing}

\Baselineskip=18pt % "one and a half" line spacing
\textheight = \topskip
   \advance\textheight by 36\Baselineskip
\def\vfactor{124}
\adjustvspacing

\skip\footins=22pt plus 16pt minus 4pt


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     DEFINE DOCUMENT STYLE OPTIONS FOR DIFFERENT INSTITUTIONS        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\ds@oneinchoffset{
  \advance\topmargin by 1in
  \advance\oddsidemargin by 1in}

\def\ds@reducetopmargin{%
   \advance\textheight by 2\Baselineskip
   \advance\topmargin by -2\Baselineskip
   \advance\abovetitleskip by 2\Baselineskip}

\def\ds@deferredtableofcontents{%
   \def\make@tableofcontents{}%
   \def\chapter{%
      \@tableofcontents
      \let\chapter=\temp@chapter
      \chapter}
   }

%\def\ds@deakin{
%   \def\@institution{Deakin University}
%   \def\@oddhead{\hbox{}\hfil\sl\thepage}  % number from page 1
%   \def\statement{%
%      \temp@chapter*{Candidates's Certificate}
%      I certify that the thesis entitled \PN{\@title} and submitted for the
%      degree of \@degree\ is the result of my own research, except where
%      otherwise acknowledged, and that this thesis (or any part of the
%      same) has not been submitted for a higher degree to any other
%      university or institution. \signed}}

\def\ds@keele{
   \def\@institution{Keele University}
   \def\@fulfilment{partial}
   \textwidth      = 155mm
   \advance\oddsidemargin by -10mm
   \doublespaced
   \ds@reducetopmargin
   \def\statement{%
      \temp@chapter*{Declaration}
      I certify that this thesis submitted for the
      degree of \@degree\ is the result of my own research, except where
      otherwise acknowledged, and that this thesis (or any part of the
      same) has not been submitted for a higher degree to any other
      university or institution. \signed}%
   \ds@deferredtableofcontents
   }

\def\ds@single{
	%% SINGLE SIDED
	\oddsidemargin  =  50mm  
	\advance\oddsidemargin by -1in
	\advance\oddsidemargin by -5mm
	\advance\evensidemargin by -5mm
	\@twosidefalse
	}
\def\ds@double{
	%% DOUBLE SIDED
	\advance\oddsidemargin by 23.5mm
	\advance\evensidemargin by -30.5mm
	%\advance\margin by -23.5mm
	}
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           SG additions 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand*\aa@tablefootname{Notes}
\newcommand*\aa@tablefootfont{\small}
\newcommand*\aa@tablefootnamefont{\small\bfseries}
\newlength{\VSpaceBeforeFigCaption}
\setlength{\VSpaceBeforeFigCaption}{5pt}
\newlength{\VSpaceAfterTabCaption}
\setlength{\VSpaceAfterTabCaption}{10pt}
\newlength{\VSpaceBeforeTabBib}
\setlength{\VSpaceBeforeTabBib}{2ex}
\newlength{\VSpaceBeforeTabFoot}
\setlength{\VSpaceBeforeTabFoot}{2ex}
\newcommand\tablefoot[1]{\VSpaceBeforeTabBib=1ex%
  \par\vspace{\VSpaceBeforeTabFoot}
  \noindent
  \begin{minipage}{\linewidth}
    {\aa@tablefootnamefont\aa@tablefootname.}~%
    \aa@tablefootfont
    \ignorespaces
    #1%
  \end{minipage}%
}
   

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\old@options  % process all document style options


