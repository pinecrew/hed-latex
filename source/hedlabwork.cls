% метаинформация
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{hedlabwork}[2013/09/21 v0.1.9]

% объявление булевых переменных
\newif\if@restonecol

% Опции
% -----
% Размер шрифта
% 2 реально используемых варианта
\newcommand\@ptsize{}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\DeclareOption{14pt}{\renewcommand\@ptsize{14}}

\newif\if@pscyr
\@pscyrfalse
\DeclareOption{pscyr}{
  \@pscyrtrue
}

% устанавливаем опции по умолчанию
\ExecuteOptions{12pt}
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

% что это и зачем оно надо?
\setcounter{topnumber}{2} % макс. число плавающих объектов вверху страницы
\renewcommand\topfraction{.7} % макс. часть страницы под float-объекты вверху
\setcounter{bottomnumber}{1} % макс. число float-объектов внизу
\renewcommand\bottomfraction{.3} % макс. часть страницы под float-объекты внизу
\setcounter{totalnumber}{3} % макс. число float-объектов на странице
\renewcommand\textfraction{.2} % мин. часть страницы, отведенная под текст
\renewcommand\floatpagefraction{.5} % мин. часть floatpage, отведенная под float

% заголовок
\def\labnum#1{\gdef\@labnum{#1}}
\def\@labnum{\@latex@error{No \noexpand\labnum given}\@ehc}

\def\labname#1{\gdef\@labname{#1}}
\def\@labname{\@latex@error{No \noexpand\labname given}\@ehc}

\def\student#1{\gdef\@student{#1}}
\def\@student{\@latex@error{No \noexpand\student given}\@ehc}

\RequirePackage{multirow}
\RequirePackage[utf8]{inputenc}
\newcommand{\makeheader}{
      \begin{table}[h!]
        \center
        \begin{tabular}{|C{.5}|C{.2}|C{.25}|} \hline
            \multicolumn{1}{|c|}
            {\multirow{4}{*}{Лабораторная работа №\@labnum}}
            & Студент, группа & \@student \\ \cline{2-3}
            & Дата выполнения & \@date \\ \cline{2-3}
            & Подпись & \\ \cline{2-3}
            \multicolumn{1}{|c|}{\multirow{3}{*}{\@labname}}
            & Дата отчёта & \\ \cline{2-3}
            & Оценка & \\ \cline{2-3}
            & Подпись & \\ \hline
        \end{tabular}
    \end{table}
}

% Семантические элементы
% ----------------------
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

\parindent=1.25cm

% сделать через нативную библиографию
%\RequirePackage[square, numbers, sort&compress]{natbib}
%\bibliographystyle{unsrt}
%\renewcommand{\@biblabel}[1]{#1.}

% удобная штука
\RequirePackage{array}
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1\textwidth}}
\renewcommand{\arraystretch}{1.2}

\endinput
