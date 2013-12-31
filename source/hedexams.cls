% метаинформация
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hedexams}[2013/12/08 v0.1.99]

\ExecuteOptions{}

\ProcessOptions
\RequirePackage[utf8]{inputenc}
\@twosidefalse    % чётные и нечётные страницы не различаются
\@twocolumnfalse
\@mparswitchfalse
\input{size12.clo} % хардкодим размер шрифта
\setlength\lineskip{1\p@} % высота строки
\setlength\normallineskip{1\p@} % на шрифте размера normal
\renewcommand\baselinestretch{} % wat?
\setlength\parskip{0\p@ \@plus \p@} % отсуп между абзацами в две высоты строки
\@lowpenalty   51 %
\@medpenalty  151 % назначение штрафов
\@highpenalty 301 %

\setcounter{secnumdepth}{1} % глубина нумерации семантических элементов
% объявляются счётчики
\newcounter {question}
\newcounter {subquestion}[question]
% представление счётчиков
\renewcommand\thequestion    {\@arabic\c@question}
\renewcommand\thesubquestion {\thequestion.\@arabic\c@subquestion}

\newcommand*\questionmark[1]{}
\newcommand\@questionname{Вопрос №}
\newcommand\question{
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@question\@squestion
                   }
\def\@question[#1]#2{
                    \ifnum \c@secnumdepth >\m@ne
                      \refstepcounter{question}%
                      \typeout{\@questionname\thequestion.\space}%
                      \addcontentsline{toc}{question}%
                        {\protect\numberline{\thequestion}#1}%
                    \else
                      \addcontentsline{toc}{question}{#1}%
                    \fi
                    \questionmark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \@makequestionhead{#2}%
                    \@afterheading
                   }
\def\@makequestionhead#1{%
  \vskip 1em%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
        \large\bfseries
        \@questionname\thequestion.\space
    \fi
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 1em
  }}
% question*
\def\@squestion#1{
                   \@makesquestionhead{#1}%
                   \@afterheading
                }
\def\@makesquestionhead#1{%
  \vskip 1em%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \large \bfseries #1\par\nobreak
    \vskip 1em
  }}

\newcommand*\subquestionmark[1]{}
\newcommand\subquestion{
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@subquestion\@ssubquestion
                   }
\def\@subquestion[#1]#2{
                    \ifnum \c@secnumdepth >\z@
                      \refstepcounter{subquestion}%
                      \typeout{\thesubquestion.\space}%
                      \addcontentsline{toc}{subquestion}%
                        {\protect\numberline{\thesubquestion}#1}%
                    \else
                      \addcontentsline{toc}{subquestion}{#1}%
                    \fi
                    \subquestionmark{#1}%
                    \@afterheading
                   }
\def\@makesubquestionhead#1{%
  \vskip 1em%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\z@
        \normalsize\bfseries
        \thesubquestion.\space
    \fi
    \interlinepenalty\@M
    \normalsize\bfseries #1\par\nobreak
    \vskip 1em
  }}
% subquestion*
\def\@ssubquestion#1{
                   \@makessubquestionhead{#1}%
                   \@afterheading
                }
\def\@makessubquestionhead#1{%
  \vskip 1em%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \normalsize\bfseries #1\par\nobreak
    \vskip 1em
  }}
% определение странных вещей
\newcommand\@pnumwidth{1.55em}% место для номеров страниц в toc, lof и lot
\newcommand\@tocrmarg{2.55em} % wtf?
\newcommand\@dotsep{4.5}      % расстояние между точками в toc, lof и lot
\setcounter{tocdepth}{1}        % установили глубину оглавления
\newcommand\tableofcontents{%
    \begin{center}
        \Large Список вопросов
    \end{center}
    \@starttoc{toc}%
    \newpage
    }
\newcommand*\l@question{\normalfont\normalsize\@dottedtocline{1}{.5em}{2.3em}}
\newcommand*\l@subquestion{\normalfont\small\@dottedtocline{1}{1.5em}{2.3em}}

% --- изображения ---
\newcounter{figure}[question]
\gdef\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
% ××× изображения ×××

% --- таблицы ---
\newcounter{table}[question]
\gdef\thetable{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
% ××× таблицы ×××


% --- подписи к таблицам и изображениям ---
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

% Гостовсие подписи
\RequirePackage{caption}
\DeclareCaptionLabelFormat{figure}{Рисунок #2}
\DeclareCaptionLabelFormat{table}{Таблица #2}
\DeclareCaptionLabelSeparator{sep}{~---~}
\captionsetup{labelsep=sep,justification=centering,font=small}
\captionsetup[figure]{labelformat=figure}
\captionsetup[table]{labelformat=table}
% ××× подписи к таблицам и изображениям ×××


\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

% --- списки ---
\setlength\leftmargini  {2.5em}
\leftmargin \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\setlength\leftmarginv  {1em}
\setlength\leftmarginvi {1em}
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty

\renewcommand{\theenumi}{\arabic{enumi}}
\newcommand{\labelenumi}{\arabic{enumi}.}
\renewcommand{\theenumii}{.\arabic{enumii}}
\newcommand{\labelenumii}{\arabic{enumi}.\arabic{enumii}.}
\renewcommand{\theenumiii}{.\arabic{enumiii}}
\newcommand{\labelenumiii}{\arabic{enumi}.\arabic{enumii}.\arabic{enumiii}.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
% ××× списки ×××

% снова длины. Почему бы всё в одном месте не определить?
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}


\setlength\paperheight{297mm} \setlength\paperwidth{210mm}
\RequirePackage{geometry}
\geometry{top=2cm, right=1cm, bottom=2cm, left=2cm}

\pagestyle{plain}
\pagenumbering{arabic}

\RequirePackage[column]{hedfeatures}

\endinput

