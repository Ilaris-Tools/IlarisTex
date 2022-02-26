\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Ilaris}[TeX Vorlage für Ilaris]


% use scrbook as baseclass and pass additional options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass{scrbook}

% load and configure packages
% ocg-p         % Druckebenen
% microtype     % Typografische Feinjustierung
% nicefrac      % Brüche mit schrägem Strich
\RequirePackage[table,dvipsnames]{xcolor}
\RequirePackage[bookmarks,pdfusetitle,colorlinks,linkcolor=black,citecolor=black,urlcolor=Sepia,breaklinks]{hyperref}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{polyglossia}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{shadowtext}
\RequirePackage{tikz}
\RequirePackage{todonotes}
\RequirePackage{fontspec}
\RequirePackage{lipsum}
\RequirePackage[breakable,skins,xparse]{tcolorbox}
\RequirePackage[top=20mm, bottom=15mm, outer=15mm, inner=15mm, marginparsep=10mm, marginparwidth=20mm, head=12.5mm, foot=8mm]{geometry}


% basic config for packages and layout
\setmainlanguage{german}
\setdefaultlanguage{german}
\tcbuselibrary{skins}
\linespread{0.9}
\rowcolors{2}{brown!55}{}

% colors
\definecolor{dunkelrot}{HTML}{450c15}
\definecolor{hellrot}{HTML}{450c15}
\definecolor{kampf}{HTML}{c86400}
\definecolor{profan}{HTML}{655743}
\definecolor{magie}{HTML}{425a66}
\definecolor{karma}{HTML}{8e5d6f}



\makeatletter
\g@addto@macro\document{% Mehrspaltiges TOC
	\BeforeStartingTOC[toc]{\begin{multicols}{2}}%
	\AfterStartingTOC[toc]{\end{multicols}}%
}
\makeatother


\graphicspath{{gfx}{bilder}}
\newcommand{\TOCnum}{1} 


% boxes
\newtcolorbox{creaturebox}[1][]{
    bicolor,
    % show bounding box,
    boxsep=0pt,
    nobeforeafter,
    top=4mm,
    arc=0mm,
    left=0mm,
    right=0mm,
    bottom=0mm,
    frame hidden,
    unbreakable,
    valign upper=bottom,
    boxrule=0pt,
    colbacklower=brown!55,
    opacityback=0,
    opacitybacklower=0.5,
    middle=0mm,
    #1
}

\newtcolorbox{pergamentbox}[1][]{
    unbreakable,
    blankest,
    top=0.05\linewidth,
    left=0.05\linewidth,
    right=0.05\linewidth,
    bottom=0.05\linewidth,
    watermark graphics=gfx/kasten/kasten.png, 
    watermark stretch=1,
    width=\linewidth,
    #1	
}

\newtcolorbox{probenbox}[1][]{
  unbreakable,
  blankest,
  top=0.08\linewidth,
  left=0.08\linewidth,
  right=0.31\linewidth,
  bottom=0.08\linewidth,
  width=\linewidth,
  height=0.44211\linewidth,
  #1
}


% layout
\setlength\parindent{0pt}% noindent anywhere
\setcounter{secnumdepth}{0}% no section numbers
\renewcaptionname{german}{\contentsname}{Inhalt}
\cehead*{% even pages (copy from rpg-latex)
	%\begin{ocg}{Hintergrund}{1}{1}
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}};
	%\end{ocg}
	}
\cohead*{% odd pages
	%\begin{ocg}{Hintergrund}{1}{1}
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}; 
	%\end{ocg}
	}
\ofoot*{\qquad\textbf{\normalfont\LARGE\thepage}\qquad}

\RedeclareSectionCommand[beforeskip=1em,afterskip=1.5em]{chapter}
\RedeclareSectionCommand[beforeskip=1.5em,afterskip=0.5em]{section}
\RedeclareSectionCommand[beforeskip=1em,afterskip=0.1em]{subsection}
\RedeclareSectionCommand[beforeskip=0em,afterskip=0.1em]{subsubsection}


% fonts
\newfontfamily{\aniron}{Aniron}
\newfontfamily{\cinzel}{Cinzel}
\setmainfont{Crimson Pro}
\setsansfont{Crimson Pro}
\setkomafont{chapterentry}{\LARGE \scshape \textbf}
\setkomafont{chapterentrypagenumber}{\normalfont\normalsize}
\addtokomafont{chapter}{\color{dunkelrot}\fontsize{26}{26}\aniron}
\addtokomafont{section}{\color{dunkelrot}\Large\aniron} 
\addtokomafont{subsection}{\fontsize{15}{16}\color{dunkelrot}\scshape\cinzel} 
%\addtokomafont{subsubsection}{\fontsize{12}{12}} 
\addtokomafont{minisec}{\normalfont\bfseries}

% chapter style
\RequirePackage{varwidth} %Breite anpassen für überlange Zeilen 
\renewcommand*{\raggedchapter}{\centering}
\renewcommand\chapterlinesformat[3]{%
      \scalebox{-1}[1]{\raisebox{-0.3\height}{\includegraphics[height=1.4cm]{gfx/layout/kapitel}}}%
	  \hspace{0.2em}%
      \begin{varwidth}{\dimexpr\textwidth-5em\relax}%
      %\begin{varwidth}{0.5\textwidth}%
        \raggedchapter#2#3%
      \end{varwidth}%
	  \hspace{0.2em}%
	  \raisebox{-0.3\height}{\includegraphics[height=1.4cm]{gfx/layout/kapitel}}%
      \par\nobreak
      \par
}


% Don't typeset a glossary heading automatically
% \makeatletter
% \renewcommand*{\@glossarysection}[2]{%
% \ifx\@@glossarysecstar\@empty
% %  \csname\@@glossarysec\endcsname{#2}% DELETED
% \else
% %  \csname\@@glossarysec\endcsname*{#2}% DELETED
%   \@gls@toc{#1}{\@@glossarysec}%
% \fi
% \@@glossaryseclabel}
% \makeatother

% befehle
\newcommand{\hr}[1][0.4pt]{\par\vskip 0.4ex \hrule height #1 \par\vskip 1ex}
\newcommand{\trennlinie}{\hr}
\newcommand{\linie}{\hr}
\newcommand{\anfang}{\raggedcolumns\frontmatter}
\newcommand{\hauptteil}{\mainmatter}
\newcommand{\schluss}{\backmatter}
\newcommand{\spaltenanfang}{\begin{multicols}{2}}
        \newcommand{\spaltenende}{\end{multicols}}
\newcommand{\skapitel}[1]{\end{multicols}\kapitel{#1}\begin{multicols}{2}}
\newcommand{\kapitel}[1]{{\let\cleardoublepage\clearpage\chapter*{#1}}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\abschnitt}[1]{\section{#1}}
\newcommand{\leereseite}{\newpage\makebox{}\clearpage}
\newcommand{\platz}{\vfill}
\newcommand{\begriff}[1]{\textbf{#1}}
\newcommand{\geschichte}[2]{%
    \vspace{3mm}
    \begin{center}
        \begin{minipage}[b]{0.9\linewidth}{\em #1}
            \begin{flushright}--- #2 \end{flushright}
        \end{minipage}
    \end{center}}
\newcommand{\kasten}[1]{\begin{pergamentbox}#1\end{pergamentbox}}
\newcommand{\inhaltsverzeichnis}{{\let\cleardoublepage\clearpage\tableofcontents}}
\newcommand{\fanprodukt}{\begin{center}\includegraphics[width=5cm]{gfx/dsa_logo_fanprodukt}\end{center}}
\newcommand{\titelbild}[1]{
    \tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth,height=\paperheight]{#1}};}
\newcommand{\tfarbe}{orange!15}
\newcommand{\tsfarbe}{black}
\newcommand{\titelfarbe}[1]{
    \renewcommand{\tfarbe}{#1}
}
\newcommand{\titelschattenfarbe}[1]{
    \renewcommand{\tsfarbe}{#1}
}
\newcommand{\titel}[1]{
    \title{#1}
    \begin{centering}
        % 26.12.2020 \\
        % \color{orange!15}
        \color{\tfarbe}
        %\vspace{0.55\textheight}
        \Huge
        %\fontfamily{\aniron}
        \fontsize{42}{42}
        \selectfont
        \aniron
        \shadowcolor{\tsfarbe}
        \shadowtext{#1} \\
    \end{centering}
}

\newcommand{\autorin}[1]{\begin{centering}\author{#1}\Large #1\\\end{centering}}
\newcommand{\titelseite}[1]{\thispagestyle{empty}#1}
%\newcommand{\kreatur}[1]{\begin{creature}#1\end{creature}}


\newcommand{\kreaturinfo}[2]{
    \footnotesize\textbf{#1: } #2}

\newcommand{\kreatur}[4]{%
    \begin{creaturebox}
        \begin{minipage}[b]{0.86\linewidth}
            {\color{dunkelrot}\Large\textbf{#1}}\\[0mm]
            \footnotesize \emph{#2}
            \vspace{1mm}
        \end{minipage}
        \hfill\includegraphics[height=1cm]{gfx/#3}%
        \vspace{-1mm}
        \hr[0.8pt]
        \tcblower
        \vspace{2mm}
        %\tcbline
        #4
        \hr
    \end{creaturebox}
}
\newcommand{\probe}[3]{%
    \begin{probenbox}[watermark graphics=gfx/proben/#1, watermark stretch=1]
        \hspace{6mm}{\color{dunkelrot}\large\textbf{#2}}\\[0.5mm]
        \footnotesize #3
    \end{probenbox}}

\newcommand{\credits}[1]{%
    \begin{center}
        #1
        \vfill
        DAS SCHWARZE AUGE, AVENTURIEN, DERE, MYRANOR, THARUN, UTHURIA, RIESLAND und
        THE DARK EYE sind eingetragene Marken der Ulisses Spiele GmbH, Waldems. Die Verwendung der
        Grafiken erfolgt unter den von Ulisses Spiele erlaubten Richtlinien. Eine Verwendung über diese
        Richtlinien hinaus darf nur nach vorheriger schriftlicher Genehmigung der Ulisses Medien und Spiel
        Distribution GmbH erfolgen.

    \end{center}
}
\newcommand{\absatz}[1]{\subsection*{#1}}
\newcommand{\block}[1]{\subsubsection*{#1}}
\newcommand{\spaltenumbruch}{\columnbreak}
\newcommand{\neuespalte}{\spaltenumbruch}
\newcommand{\seitenumbruch}{\newpage}
\newcommand{\neueseite}{\seitenumbruch}

\newcommand{\credit}[2]{%
    \begin{center}
        {\aniron\fontsize{18}{18}\color{dunkelrot}#1}\\
        #2
    \end{center}
}%
\newcommand{\lizenz}{
    \vfill
    \begin{center}
        DAS SCHWARZE AUGE, AVENTURIEN, DERE, MYRANOR, THARUN, UTHURIA, RIESLAND und
        THE DARK EYE sind eingetragene Marken der Ulisses Spiele GmbH, Waldems. Die Verwendung der
        Grafiken erfolgt unter den von Ulisses Spiele erlaubten Richtlinien. Eine Verwendung über diese
        Richtlinien hinaus darf nur nach vorheriger schriftlicher Genehmigung der Ulisses Medien und Spiel
        Distribution GmbH erfolgen.
    \end{center}
}
\newcommand{\creditlayout}{
    \credit{Layoutvorlage}{\href{https://github.com/Ilaris-dev/IlarisTex}{IlarisTex}}
}
\newcommand{\kreaturkampfwerte}[4]{
    \kreaturkampfwert{Wundschwelle}{#1}
    \kreaturkampfwert{Magieresistenz}{#2}
    \kreaturkampfwert{Geschwindigkeit}{#3}
    \kreaturkampfwert{Initiative}{#4}
}
\newcommand{\kreaturwaffe}[6]{
    \textbf{#1} \hfill RW #2 \hfill VT #3 \hfill AT #4 \hfill TP #5 \par \hspace{4mm} \textit{#6}\par
}
\newcommand{\kreaturkampfwert}[2]{\kreaturinfo{#1}{#2}\par}
\newcommand{\WsMrGsIni}[4]{\kreaturkampfwerte{#1}{#2}{#3}{#4}}
\newcommand{\kreaturvorteile}[1]{#1}
\newcommand{\kreaturkampfvorteile}[1]{\kreaturinfo{Kampfvorteile}{#1}}
\newcommand{\kreaturfertigkeiten}[1]{\kreaturinfo{Fertigkeiten}{#1}}
\newcommand{\kreaturattribute}[1]{\kreaturinfo{Attribute}{#1}}
\newcommand{\kreaturvarianten}[1]{\kreaturinfo{Varianten}{#1}}
\newcommand{\tabelle}[2]{\begin{tabularx}{\linewidth}{#1}#2\end{tabularx}}
\newcommand{\maybe}[2]{
    \ifx&#1&
        Argument 1 was blank!
    \else
        Argument 1 was not blank.
    \fi
    Argument 2 was #2.
}
\newcommand{\tkopf}[1]{\aniron #1 }
\newcommand{\tzeile}[1]{#1 \\}
% \newcommand{\tzeile1}[1]{#1 \\}
% \newcommand{\tzeile2}[2]{#1 & #2 \\}
% \newcommand{\tzeile3}[3]{#1 & #2 & #3 \\}
% \newcommand{\tzeile4}[4]{#1 & #2 & #3 & #4 \\}
% \newcommand{\tzeile5}[5]{#1 & #2 & #3 & #4 & #5 \\}
% \newcommand{\tzeile6}[6]{#1 & #2 & #3 & #4 & #5 & #6 \\}
% \newcommand{\tzeile7}[7]{#1 & #2 & #3 & #4 & #5 & #6 & #7 \\}
% \newcommand{\tzeile8}[8]{#1 & #2 & #3 & #4 & #5 & #6 & #7 & #8 \\}


\newcommand{\zeichnung}[1][width=\linewidth]{\begin{tikzpicture}%
	\node [blend mode=multiply] at (0,0) {\includegraphics[width=\linewidth]{#1}};%
\end{tikzpicture}}


% extras
\newcommand{\glossareintrag}[2]{\newglossaryentry{#1}{#2}}
