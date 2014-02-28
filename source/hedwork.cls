% метаинформация
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hedwork}[2014/01/27 v0.1.99]

% объявление булевых переменных
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse

\newif\if@chapters
\@chaptersfalse
\DeclareOption{chapters} {
  \@chapterstrue
}

% Опции
% -----
% Размер шрифта
% 2 реально используемых варианта
\newcommand\@ptsize{}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}

% наличие титульного листа
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}


% библиография (не тронуто)
\DeclareOption{openbib}{%
  \AtEndOfPackage{% отложенное исполнение -- исполняется в конце класса
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\newif\if@pscyr
\@pscyrfalse
\DeclareOption{pscyr}{
  \@pscyrtrue
}

% устанавливаем опции по умолчанию
\ExecuteOptions{14pt,titlepage}
% выполняем действия для выбранных опций
\ProcessOptions

% Треш
% ----
\@twosidefalse    % чётные и нечётные страницы не различаются
\@mparswitchfalse
\@twocolumnfalse  % текст в одну колонку

% форматирование текста
\input{size\@ptsize.clo} % берутся из tex/latex/base и tex/latex/extsizes
\RequirePackage{exscale}
\RequirePackage{indentfirst}
% устанавливаются значения параметров
\setlength\lineskip{1\p@} % высота строки
\setlength\normallineskip{1\p@} % на шрифте размера normal
\renewcommand\baselinestretch{} % wat?
\setlength\parskip{0\p@ \@plus \p@} % отсуп между абзацами в две высоты строки
\@lowpenalty   51 %
\@medpenalty  151 % назначение штрафов
\@highpenalty 301 %


% размер листа
\setlength\paperheight{297mm} \setlength\paperwidth{210mm}
\RequirePackage{geometry}
\geometry{top=2cm, right=1cm, bottom=2cm, left=2cm}

\setcounter{topnumber}{2} % макс. число плавающих объектов вверху страницы
\renewcommand\topfraction{.7} % макс. часть страницы под float-объекты вверху
\setcounter{bottomnumber}{1} % макс. число float-объектов внизу
\renewcommand\bottomfraction{.3} % макс. часть страницы под float-объекты внизу
\setcounter{totalnumber}{3} % макс. число float-объектов на странице
\renewcommand\textfraction{.2} % мин. часть страницы, отведенная под текст
\renewcommand\floatpagefraction{.5} % мин. часть floatpage, отведенная под float

% титульный лист
% --------------
% если нужен титульный лист
\if@titlepage
  % переменные для титульного листа
  \def\faculty#1{\gdef\@faculty{#1}}
  \def\@faculty{\@latex@error{No \noexpand\faculty given}\@ehc}

  \def\department#1{\gdef\@department{#1}}
  \def\@department{\@latex@error{No \noexpand\department given}\@ehc}

  \def\subject#1{\gdef\@subject{#1}}
  \def\@subject{\@latex@error{No \noexpand\subject given}\@ehc}

  \def\topic#1{\gdef\@topic{#1}}

  \def\@fletter{f}
  \def\@aletter{a}

  \def\student[#1]#2{\gdef\@student{#2}\gdef\@studentfemale{#1}}
  \def\@student{\@latex@error{No \noexpand\student given}\@ehc}

  \def\teacher[#1]#2{\gdef\@teacher{#2}\gdef\@teacherfemale{#1}}
  \def\@teacher{\@latex@error{No \noexpand\teacher given}\@ehc}

  \def\type#1{\gdef\@type{#1}}

  \def\semnum#1{\gdef\@semnum{#1}}

  \def\variant#1{\gdef\@variant{#1}}

  \newcommand\maketitle{
    \begin{titlepage}
      \begin{center}
        Министерство образования и науки Российской Федерации \\
        Федеральное государственное бюджетное образовательное \\
        учреждение высшего профессионального образования \\
        <<Волгоградский государственный технический университет>> \\
        \@faculty \\
        Кафедра \@department
      \end{center}
      \vspace{9em}
      \begin{center}
        \large \ifx\@type\undefined
          Семестровая работа\
        \else
          \@type\
        \fi
        \ifx\@semnum\undefined
        \else
          №\@semnum\
        \fi
        по дисциплине\\
        <<\@subject>>\\
        \ifx\@topic\undefined
        \else
          на тему \\
          <<\@topic>>
        \fi
      \end{center}
      \ifx\@variant\undefined
        \vspace{5em}
      \else
        \vspace{1em}
        \begin{center}
          Вариант №\@variant
        \end{center}
        \vspace{3em}
      \fi

      \begin{flushright}
        \begin{minipage}{.40\textwidth}
          Выполнил\ifx\@studentfemale\@fletter
            а
          \else
            \ifx\@studentfemale\@aletter
              и
            \fi
          \fi
          \\ \@student \\
          \vspace{1em}\\
          Проверил\ifx\@teacherfemale\@fletter
            а
          \fi
          \\ \@teacher
        \end{minipage}
      \end{flushright}
      \vspace{\fill}
      \begin{center}
        Волгоград, \the\year
      \end{center}
    \end{titlepage}
    \setcounter{page}{2}
    \setcounter{footnote}{0}%
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@department\@empty
    \global\let\@faculty\@empty
    \global\let\@topic\@empty
    \global\let\@student\@empty
    \global\let\@subject\@empty
    \global\let\@teacher\@empty
    \global\let\@thanks\@empty
    \global\let\@title\@empty
    \global\let\@studentfemale\@empty
    \global\let\@teacherfemale\@empty
    \global\let\@type\@empty
    \global\let\@variant\@empty
    \global\let\@semnum\@empty
    \global\let\and\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\department\relax
    \global\let\faculty\relax
    \global\let\maketitle\relax
    \global\let\topic\relax
    \global\let\student\relax
    \global\let\subject\relax
    \global\let\teacher\relax
    \global\let\thanks\relax
    \global\let\title\relax
    \global\let\studentfemale\relax
    \global\let\teacherfemale\relax
    \global\let\type\relax
    \global\let\variant\relax
    \global\let\semnum\relax
  }
% если не нужен титульный лист
\else
  \newcommand\maketitle{}
\fi % end of \if@titlepage

% Семантические элементы
% ----------------------
\setcounter{secnumdepth}{3} % глубина нумерации семантических элементов
% объявляются счётчики
\if@chapters
  \newcounter {chapter}
  \newcounter {section}[chapter]
\else
  \newcounter {section}
\fi
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
% представление счётчиков
\if@chapters
  \renewcommand\thechapter      {\@arabic\c@chapter}
  \renewcommand\thesection      {\thechapter.\@arabic\c@section}
\else
  \renewcommand\thesection      {\@arabic\c@section}
\fi
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}

% объявление команд секционирования
% chapter
\if@chapters
  \newcommand*\chaptermark[1]{}
  \newcommand\@chapapp{\chaptername}
  \newcommand\chapter{
                      \thispagestyle{plain}%
                    \global\@topnum\z@
                      \@afterindentfalse
                      \secdef\@chapter\@schapter
                     }
  \def\@chapter[#1]#2{
                      \ifnum \c@secnumdepth >\m@ne
                        \refstepcounter{chapter}%
                        \typeout{\@chapapp\space\thechapter.}%
                        \addcontentsline{toc}{chapter}%
                          {\protect\numberline{\thechapter}#1}%
                      \else
                        \addcontentsline{toc}{chapter}{#1}%
                      \fi
                      \chaptermark{#1}%
                      \addtocontents{lof}{\protect\addvspace{10\p@}}%
                      \addtocontents{lot}{\protect\addvspace{10\p@}}%
                      \@makechapterhead{#2}%
                      \@afterheading
                     }
  \def\@makechapterhead#1{%
    \vskip 1em%
    {\parindent \z@ \raggedright \normalfont
      \ifnum \c@secnumdepth >\m@ne
          \large\bfseries
          \@chapapp\space
          \thechapter.
      \fi
      \interlinepenalty\@M
      \large \bfseries #1\par\nobreak
      \vskip 1em
    }}
  % chapter*
  \def\@schapter#1{
                     \@makeschapterhead{#1}%
                     \@afterheading
                  }
  \def\@makeschapterhead#1{%
    \vskip 1em%
    {\parindent \z@ \raggedright \normalfont
      \interlinepenalty\@M
      \large \bfseries #1\par\nobreak
      \vskip 1em
    }}
\fi
\newcommand\section{\@startsection {section}
                                     {1}  % уровень секционирования
                                     {\z@}% отступ слева
                                     {3ex}% отступ сверху
                                     {3ex}% отступ снизу
                                     {\normalfont\normalsize\bfseries}} % шрифт
\newcommand\subsection{\@startsection{subsection}
                                     {2}
                                     {\z@}%
                                     {2ex}%
                                     {2ex}%
                                     {\normalfont\normalsize\bfseries}}
\newcommand\subsubsection{\@startsection{subsubsection}
                                     {3}
                                     {\z@}%
                                     {2ex}%
                                     {2ex}%
                                     {\normalfont\normalsize\bfseries}}
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

% --- окружения ---
% окружение описательного характера description
% http://en.wikibooks.org/wiki/LaTeX/List_Structures#Description
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

% окружение для реферата/аннотации к работе
% http://en.wikibooks.org/wiki/LaTeX/Document_Structure#Abstract
\if@titlepage
  \newenvironment{abstract}{%
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\newpage}
\else
  \newenvironment{abstract}{%
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
        \endquotation
  }
\fi

% цитаты
% http://en.wikibooks.org/wiki/LaTeX/Paragraph_Formatting#Quoting_text
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}


% окружение для титульной страницы
\newenvironment{titlepage}
    {%
        \@restonecolfalse\newpage
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}{2}
     \fi
    }
% ××× окружения ×××

% приложение
\newcommand\appendix{\par
\if@chapters
  \setcounter{chapter}{0}%
  \gdef\thechapter{\@Alph\c@chapter}
\fi
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%}
  \gdef\thechapter{\@Alph\c@section}}

% снова длины. Почему бы всё в одном месте не определить?
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

% опять счётчики и представления
\renewcommand\theequation{\@arabic\c@equation}

% --- изображения ---
\newcounter{figure}
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
\newcounter{table}
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
\RequirePackage[utf8]{inputenc}
\DeclareCaptionLabelFormat{figure}{Рисунок #2}
\DeclareCaptionLabelFormat{table}{Таблица #2}
\DeclareCaptionLabelSeparator{sep}{~---~}
\captionsetup{labelsep=sep,justification=centering,font=small}
\captionsetup[figure]{labelformat=figure}
\captionsetup[table]{labelformat=table}
% ××× подписи к таблицам и изображениям ×××

\if@pscyr
  \RequirePackage{pscyr}
\fi
% шрифты. что делает эта команда?
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

% определение странных вещей
\newcommand\@pnumwidth{1.55em}% место для номеров страниц в toc, lof и lot
\newcommand\@tocrmarg{2.55em} % wtf?
\newcommand\@dotsep{4.5}      % расстояние между точками в toc, lof и lot


% --- оглавление ---
\setcounter{tocdepth}{3}        % установили глубину оглавления

\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \newpage
    }
% что это за сущности вида "\l@..."?
% по ходу дела, это способ отображения в toc, lof, lot
\if@chapters
  \newcommand*\l@chapter[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip 1.0em \@plus\p@
      \setlength\@tempdima{1.5em}%
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
      \endgroup
    \fi}
  \newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
  \newcommand*\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
  \newcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\else
  \newcommand*\l@section[2]{%
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}%
      \vskip 1.0em \@plus\p@
      \setlength\@tempdima{1.5em}%
      \begingroup
        \parindent \z@ \rightskip \@pnumwidth
        \parfillskip -\@pnumwidth
        \leavevmode \bfseries
        \advance\leftskip\@tempdima
        \hskip -\leftskip
        #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
        \penalty\@highpenalty
      \endgroup
    \fi}
  \newcommand*\l@subsection{\@dottedtocline{1}{1.5em}{2.3em}}
  \newcommand*\l@subsubsection{\@dottedtocline{2}{3.8em}{3.2em}}
\fi

% список изображений
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}

% список таблиц
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure
% ××× оглавление ×××

% библиография
\newdimen\bibindent
\setlength\bibindent{1.5em} % в каком месте эта идентация торчит?
\newenvironment{thebibliography}[1]
     {\section*{\refname
        \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy\clubpenalty4000\widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
% что это?
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
% что это за команды?
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
% это подчёркивание над сносками?
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
% а это что?
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}

% определения
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\newcommand\refname{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\appendixname{Appendix}
\newcommand\abstractname{Abstract}
\newcommand\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{plain}
\pagenumbering{arabic}

\parindent=1.25cm

% сделать через нативную библиографию
%\RequirePackage[square, numbers, sort&compress]{natbib}
%\bibliographystyle{unsrt}
%\renewcommand{\@biblabel}[1]{#1.}

% удобная штука
\RequirePackage[column]{hedfeatures}

\endinput
