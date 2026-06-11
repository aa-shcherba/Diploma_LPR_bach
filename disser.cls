%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dissertation style
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{disser}[2003/10/18 v1.0 Local class by I. Morozov]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

\LoadClass[a4paper,12pt,oneside]{book}
\usepackage[cp1251]{inputenc}
\usepackage[russian,english]{babel}
\usepackage{cite}
\usepackage{amssymb}
\usepackage{epsfig}
\usepackage{array}
%\usepackage[rlft]{floatflt}

\renewcommand\English{\selectlanguage{english}}

% ============================================================================
% Page layout
% ============================================================================

\renewcommand{\@oddhead}{\hfill ---\ \thepage\ --- \hfill}
\renewcommand{\@oddfoot}{}
\oddsidemargin=5mm
\textwidth=165mm
\topmargin=-10mm
\textheight=245mm
\parindent=12mm

\tolerance=400

% Parameters of floating objects
\renewcommand\floatpagefraction{0.75}
\setlength\intextsep{20pt plus 8pt minus 4pt}

\setlength\extrarowheight{4pt}
\setlength\tabcolsep{10pt}

% ============================================================================
% Captions
% ============================================================================

\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% ============================================================================
% Sectioning
% ============================================================================

%\renewcommand\@chapapp{Глава}
\renewcommand\thechapter{Глава\ \arabic{chapter}.}
\renewcommand\thesection{\S\kern.25em\arabic{chapter}.\arabic{section}}
\renewcommand\thesubsection{\thesection.\arabic{subsection}}
\renewcommand\theequation{\arabic{chapter}.\arabic{equation}}
\renewcommand\thefigure{\arabic{chapter}.\arabic{figure}}
\renewcommand\thetable{\arabic{chapter}.\arabic{table}}

% Arguments of \@startsection:
% #1 - name
% #2 - level
% #3 - horizontal title indentation !!! numbers < 0 suppress paragraph indentation !!!
% #4 - vertical space before title
% #5 - vertical space after section title
% #6 - title format
% ex = height of letter x, em = width of letter M

\renewcommand\section{%
  \@startsection{section}{1}{\z@}%
  {3.5ex \@plus 1ex \@minus .2ex}{2.5ex \@plus.2ex}
  {\normalfont\large\bfseries}}

\renewcommand\subsection{%
  \@startsection{subsection}{2}{\z@}%
  {3.ex\@plus 1ex \@minus .2ex}{1.5ex \@plus .2ex}%
  {\normalfont\large\bfseries}}

\renewcommand\chapter{%
  \if@openright\cleardoublepage\else\clearpage\fi
%  \thispagestyle{plain}
  \global\@topnum\z@
  \@afterindenttrue %!
  \secdef\@chapter\@schapter
}

\def\@makechapterhead#1{%
  \vspace*{10mm}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \Huge \bfseries \thechapter\space  #1\par\nobreak
    \vskip 20mm
  }} 
  
\def\@makeschapterhead#1{%
  \vspace*{10mm}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 20mm
  }}   

% ============================================================================
% Table of contents
% ============================================================================

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.7em \@plus\p@
    \setlength\@tempdima{4.8em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1 \nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi} 

\renewcommand\l@section{\@dottedtocline{2}{1.5em}{2.8em}}

% ============================================================================
% Additional environments
% ============================================================================

\newenvironment{mydocument}[1][1]{
  \addtocounter{chapter}{-1}
  \addtocounter{chapter}{+#1}
  \document
  \Russian\large
  }{
  \enddocument
}

\newenvironment{myfigure}[1][htbp]{
  \begin{figure}[#1]
  \renewcommand{\figurename}{Рис.}
  \centering
}{
  \end{figure}
}

\newenvironment{myfltfigure}[1]{
  \begin{floatingfigure}[r]{#1}
  \renewcommand{\figurename}{Рис.}
  \centering
}{
  \end{floatingfigure}
}

\newenvironment{mytable}[1][htbp]{
  \begin{table}[#1]
  \renewcommand{\tablename}{Таблица}
  \centering
}{
  \end{table}
}

% ============================================================================
% Useful commands
% ============================================================================

%Decimal delimiter
\renewcommand{\.}{,\!}

\newcommand{\beq}{\begin{equation}}
\newcommand{\eeq}{\end{equation}}
\newcommand{\bea}{\begin{eqnarray}}
\newcommand{\eea}{\end{eqnarray}}
\newcommand{\beqn}{\bean}
\newcommand{\eeqn}{\eean}
\newcommand{\bean}{\begin{eqnarray*}}
\newcommand{\eean}{\end{eqnarray*}}

\newcommand{\ave}[1]{\left\langle #1\right\rangle}
\newcommand{\e}{{\rm e}}
\newcommand{\dd}{\,{\rm d}}

\newcommand{\vek}[1]{\mbox{\bf#1}}                   % Vector(bold)
\newcommand{\vi}[1]{\mbox{\scriptsize\bf#1}}         % Vector index
\newcommand{\vvi}[1]{\mbox{\tiny\bf#1}}              % Vector subindex
\newcommand{\mvek}[1]{\mbox{\boldmath$#1$}}          % Vector(bold math)
\newcommand{\mvi}[1]{\mbox{\scriptsize\boldmath$#1$}}% Vector index(bold math)
