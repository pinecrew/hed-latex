% метаинформация
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hedsemwork}[2013/09/21 v0.1.9]

% объявление команды для размера шрифта
\newcommand\@ptsize{}

% зачем нужны следующие 2 строчки?
\newif\if@restonecol
\newif\if@titlepage

\@titlepagefalse
% Жёстко задаём размер бумаги (А4), одностороннюю печать и расположение
% текста в 1 колонку
\setlength\paperheight{297mm} \setlength\paperwidth{210mm}
\@twosidefalse \@mparswitchfalse
\@twocolumnfalse

% Размер шрифта как опция
% Оставил только 2 реально используемых варианта
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}

% теперь остальные опции
% нужно продумать концепции draft и final, и по возможности либо избавиться от
% них, либо связать их с опциями [no]titlepage
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% вдруг захочется собрать без титульника, чтобы кому-нибудь продемонстрировать
% содержание без лишних листов
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}

% опции, меняющие отображение формул
% leqno отображает номер формулы слева
% fleqn выравнивает формулу по левому краю вместо центрирования
% http://texblog.org/tag/fleqn/#formula
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
% опция библиографии
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

% опции по умолчанию
\ExecuteOptions{14pt,final}

% что тут происходит?
\ProcessOptions
\def\EC@family#1#2#3#4#5{%
  \DeclareFontShape{#1}{#2}{#3}{#4}%
  {<5><6><7><8><9><10><10.95><12><14.4>%
   <17.28><20.74><24.88><29.86><35.83><42.99><51.59>genb*#5}{}}
\EC@family{T1}{cmr}{m}{n}{ecrm}
\EC@family{T1}{cmr}{m}{sl}{ecsl}
\EC@family{T1}{cmr}{m}{it}{ecti}
\EC@family{T1}{cmr}{m}{sc}{eccc}
\EC@family{T1}{cmr}{bx}{n}{ecbx}
\EC@family{T1}{cmr}{b}{n}{ecrb}
\EC@family{T1}{cmr}{bx}{it}{ecbi}
\EC@family{T1}{cmr}{bx}{sl}{ecbl}
\EC@family{T1}{cmr}{bx}{sc}{ecxc}
\EC@family{T1}{cmr}{m}{ui}{ecui}
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {<5><6><7><8><9><10><12>gen*cmr%
      <10.95>cmr10%
      <14.4>cmr12%
      <17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmr17}{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {<5><6><7>cmsl8%
      <8><9>gen*cmsl%
      <10><10.95>cmsl10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {<5><6><7>cmti7%
      <8>cmti8%
      <9>cmti9%
      <10><10.95>cmti10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
   {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmu10%
      }{}
\DeclareFontShape{OT1}{cmr}{b}{n}
     {<5><6><7><8><9><10><10.95><12>%
      <14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmb10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{n}
   {<5><6><7><8><9>gen*cmbx%
      <10><10.95>cmbx10%
      <12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
      {<5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
      {<5><6><7><8><9>%
      <10><10.95><12><14.4><17.28><20.74><24.88><29.86><35.83><42.99><51.59>cmbxti10%
      }{}
\input{size\@ptsize.clo} % tex/latex/base и tex/latex/extsizes
\RequirePackage{exscale}
% устанавливаются значения параметров
\setlength\lineskip{1\p@} % высота строки
\setlength\normallineskip{1\p@} % на шрифте размера normal
\renewcommand\baselinestretch{} % wat?
\setlength\parskip{0\p@ \@plus \p@} % отсуп между абзацами в две высоты строки
\@lowpenalty   51 %
\@medpenalty  151 % назначение штрафов
\@highpenalty 301 %

% что это и зачем оно надо?
\setcounter{topnumber}{2} % макс. число плавающих объектов вверху страницы
\renewcommand\topfraction{.7} % макс. часть страницы под float-объекты вверху
\setcounter{bottomnumber}{1} % макс. число float-объектов внизу
\renewcommand\bottomfraction{.3} % макс. часть страницы под float-объекты внизу
\setcounter{totalnumber}{3} % макс. число float-объектов на странице
\renewcommand\textfraction{.2} % мин. часть страницы, отведенная под текст
\renewcommand\floatpagefraction{.5} % мин. часть floatpage, отведенная под float

% зачем это и как оно работает?
\def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{%
        \markright {\MakeUppercase{%
            \ifnum \c@secnumdepth >\m@ne
                \thesection\quad
            \fi
##1}}}}
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\sectionmark\@gobble
    \let\subsectionmark\@gobble
}

% look here! There's a strange titlepage!
\if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
\else
  \newcommand\maketitle{\par
    \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% что это такое?
\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi % end of \if@titlepage

\setcounter{secnumdepth}{3} % глубина нумерации семантических элементов

% объявляются счётчики
\newcounter {section}
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
% представление счётчиков
\renewcommand\thesection      {\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}

% объявление команд секционирования
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
% задание размеров. что и зачем?
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

% ещё немного представлений для счётчиков. почему не все в одном месте?
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}


% создание окружений. что и зачем здесь?
%
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
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
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

% следующие трм:
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
        \setcounter{page}\@ne
     \fi
    }

% приложение
\newcommand\appendix{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \gdef\thesection{\@Alph\c@section}}

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

% плавющие объекты -- фигуры и таблицы
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

% установили глубину содержания
\setcounter{tocdepth}{3}
% содержание
\newcommand\tableofcontents{%
    \section*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    }
% что это за сущности вида "\l@..."?
% по ходу дела, это способ отображения в toc, lof, lot
\newcommand*\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{1.0em \@plus\p@}%
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}
\newcommand*\l@subsection{\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{3.8em}{3.2em}}

% клёвая команда, выводит список фигур в стиле содержания
\newcommand\listoffigures{%
    \section*{\listfigurename
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}}%
    \@starttoc{lof}%
    }
\newcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand\listoftables{%
    \section*{\listtablename
      \@mkboth{%
          \MakeUppercase\listtablename}{\MakeUppercase\listtablename}}%
    \@starttoc{lot}%
    }
\let\l@table\l@figure

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
\if@twoside
\else
  \raggedbottom
\fi
\onecolumn
\endinput
%%
%% End of file `extarticle.cls'.
%%
%% А вот это нужно записать с минимумом использованных пакетов
%%
\RequirePackage[paper=a4paper, top=1cm, right=1cm, bottom=1.5cm, left=2cm]{geometry}
\RequirePackage{ifthen}
\RequirePackage{array}
\onehalfspacing

\RequirePackage{graphicx}
\graphicspath{{plots/}, {images/}}

\parindent=1.25cm



\RequirePackage[square, numbers, sort&compress]{natbib}
\bibliographystyle{unsrt}
\renewcommand{\@biblabel}[1]{#1.}

\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1\textwidth}}
\renewcommand{\arraystretch}{1.2}

% \maketitlepage{факультет}{кафедра}{дисциплина}{номер работы}{номер варианта}
% {студент}{пол студента}{преподаватель}{пол преподавателя}
% Пол: f -- женский, всё остальное -- мужской.
% Вариант: если варианта нет -- оставить пустым.
\newcommand{\maketitlepage}[9]{
    \begin{titlepage}
    \singlespacing
        \newpage
        \begin{center}
    Министерство образования и науки Российской Федерации \\
        Федеральное государственное бюджетное образовательное \\
        учреждение высшего профессионального образования \\
        <<Волгоградский государственный технический университет>> \\
#1 \\
        Кафедра #2
        \end{center}
    \vspace{9em}
    \begin{center}
    \large Семестровая работа
        \ifthenelse{\equal{#4}{}}{\!\!}{№#4} по дисциплине
        \\ <<#3>>
        \end{center}
    \ifthenelse{\equal{#5}{}}{\vspace{5em}}{
        \vspace{1em}
        \begin{center}
        Вариант №#5
            \end{center}
        \vspace{3em}
    }

    \begin{flushright}
    \begin{minipage}{.40\textwidth}
    Выполнил\ifthenelse{\equal{#7}{f}}{а}{}:\\#6\\
        \vspace{1em}\\
        Проверил\ifthenelse{\equal{#9}{f}}{а}{}:\\#8
        % \vspace{1em}\\
        % Дата сдачи\\семестровой\\
        % на проверку: \hrulefill
        % \vspace{1em}\\
        % Оценка \rule{2cm}{0.5pt} б, \hrulefill
        \end{minipage}
    \end{flushright}
    \vspace{\fill}
    \begin{center}
    Волгоград, \the\year
        \end{center}

    \end{titlepage}
    \setcounter{page}{2}
}
