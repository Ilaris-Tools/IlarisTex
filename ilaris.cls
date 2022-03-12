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


% colors
\definecolor{dunkelrot}{HTML}{450c15}
\definecolor{dunkelbraun}{HTML}{39220d}
\definecolor{braun}{HTML}{6f5843} % linien?
\definecolor{hellrot}{HTML}{450c15}
\definecolor{beige}{HTML}{e7d1b3}  % kastenhintergrund
\definecolor{kampf}{HTML}{c86400}
\definecolor{profan}{HTML}{655743}
\definecolor{magie}{HTML}{425a66}
\definecolor{karma}{HTML}{8e5d6f}


\RequirePackage[bookmarks,pdfusetitle,colorlinks,linkcolor=dunkelrot,citecolor=dunkelbraun,urlcolor=Sepia,breaklinks]{hyperref}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{polyglossia}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{shadowtext}
\RequirePackage{tikz} 
\RequirePackage{csquotes}
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
\rowcolors{2}{}{brown!55}




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
    watermark graphics=gfx/kasten/kasten_farbe.png, 
    watermark stretch=1,
    width=\linewidth,
    #1
}
\newtcolorbox{pergamentboxgrau}[1][]{
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
  arc=0mm,
  top=0.08\linewidth,
  left=0.08\linewidth,
  right=0.31\linewidth,
  bottom=0.08\linewidth,
  width=\linewidth,
  height=0.44211\linewidth,
  #1
}

\newtcolorbox{infobox}[1][]{
    enhanced jigsaw,
    unbreakable,
    %blankest,
    boxsep=0pt,
    %nobeforeafter,
    arc=0mm,
    outer arc=0mm
    boxrule=0mm,
    leftrule=1mm,
    rightrule=0mm,
    bottomrule=0mm,
    toprule=0mm,
    top=2mm,
    left=2mm,
    right=2mm,
    bottom=2mm,
    colframe=dunkelrot,
    width=\linewidth,
    colback=beige,
    #1
}

\newtcolorbox{bildbox}[1][]{
	width=\linewidth, arc=0mm, unbreakable,
	top=0mm, left=0mm, right=0mm, bottom=0mm,
	colback=braun, colframe=braun, 
	enhanced,
	#1
}
\providecommand{\rahmen}[1]{
	\vspace{5mm}
	\begin{bildbox}[overlay={%
			\node[anchor=center, inner sep=0] at (frame.center) {\includegraphics[width=0.98\linewidth, keepaspectratio]{#1}};
			%\node[anchor=north east] at ([xshift=1.5mm, yshift=5.6mm]frame.north east) {\includegraphics[width=30mm, keepaspectratio]{gfx/kasten/eckeor.png}};
			\node[anchor=north east] at ([xshift=4.8mm, yshift=5.6mm]frame.north east) {\includegraphics[angle=180,origin=c,width=30mm, keepaspectratio]{gfx/kasten/ecke.png}};
			\node[anchor=south west] at ([xshift=-4.8mm, yshift=-5.6mm]frame.south west) {\includegraphics[width=30mm, keepaspectratio]{gfx/kasten/ecke.png}};
		}]
	\noindent\phantom{\includegraphics[width=\linewidth, keepaspectratio]{#1}}
	\end{bildbox}
	\vspace{5mm}
	\leavevmode
}


% layout
\setlength\parindent{0pt}% noindent anywhere
\setcounter{secnumdepth}{0}% no section numbers
\renewcaptionname{german}{\contentsname}{Inhalt}
\cehead*{
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}};
	}
\cohead*{% odd pages
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}; 
	}
\ofoot*{\qquad\textbf{\normalfont\LARGE\thepage}\qquad}

\RedeclareSectionCommand[beforeskip=1em,afterskip=1.5em]{chapter}
\RedeclareSectionCommand[beforeskip=1.5em,afterskip=0.5em,
    tocentryformat=\color{dunkelrot}\cinzelsemi
    %tocpagenumberformat=\usekomafont{disposition}
  ]{section}
\RedeclareSectionCommand[beforeskip=1em,afterskip=0.1em]{subsection}
\RedeclareSectionCommand[beforeskip=0em,afterskip=0.1em]{subsubsection}


% fonts
\newfontfamily{\aniron}{Aniron-Bold.ttf}
\newfontfamily{\cinzel}{Cinzel-Regular.ttf}
\newfontfamily{\cinzelbold}{Cinzel-Bold.ttf}
\newfontfamily{\cinzelsemi}{Cinzel-SemiBold.ttf}
\newfontfamily{\crimsonblack}{CrimsonPro-Black.ttf}
%\setmainfont[BoldFont={Crimson Pro, Bold}]{Crimson Pro}
\setmainfont[BoldFont=CrimsonPro-Bold.ttf, ItalicFont=CrimsonPro-Italic.ttf, BoldItalicFont=CrimsonPro-BoldItalic.ttf]{CrimsonPro-Regular.ttf}
\setsansfont{CrimsonPro-Regular.ttf}
\setkomafont{chapterentry}{\LARGE \scshape \cinzelsemi \color{dunkelrot}}
%\setkomafont{sectionentry}{\large \scshape \cinzelbold \color{dunkelrot}}
\setkomafont{chapterentrypagenumber}{\normalsize}
\addtokomafont{chapter}{\color{dunkelrot}\fontsize{26}{26}\aniron}
\addtokomafont{section}{\color{dunkelrot}\Large\aniron} 
\addtokomafont{subsection}{\fontsize{15}{16}\color{dunkelrot}\scshape\cinzelbold} 
\addtokomafont{subsubsection}{\fontsize{11}{11}\color{dunkelrot}\scshape\cinzelbold} 
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
\newcommand{\hr}[1][0.4pt]{\par\vskip 0.4ex {\color{dunkelrot}\hrule height #1 }\par\vskip 1ex}
\newcommand{\trennlinie}{\vspace{2mm}\hr\vspace{2mm}}
\newcommand{\linie}{\hr}
\newcommand{\anfang}{\raggedcolumns\frontmatter}
\newcommand{\hauptteil}{\mainmatter\pagestyle{plain}}
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
\newcommand{\kastengrau}[1]{\begin{pergamentboxgrau}#1\end{pergamentboxgrau}}
\newcommand{\tiefesinhaltsverzeichnis}{{\let\cleardoublepage\clearpage\tableofcontents}}
\newcommand{\inhaltsverzeichnis}{\setcounter{tocdepth}{1}\tiefesinhaltsverzeichnis}
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
            {\color{dunkelrot}\Large\cinzelsemi #1}\\[0mm]
            \footnotesize \emph{#2}
            \vspace{1mm}
        \end{minipage}
        \hfill\includegraphics[height=1cm, width=1cm]{#3}%
        \vspace{-1mm}
        \hr[0.8pt]
        \tcblower
        \setlength{\leftskip}{2mm}
        \setlength{\rightskip}{2mm}
        \vspace{2mm}
        %\tcbline
        #4
        \vspace{2mm}
        \hr
        \setlength{\leftskip}{0mm}
        \setlength{\rightskip}{0mm}
    \end{creaturebox}
}
\newcommand{\probe}[3]{%
    \begin{probenbox}[watermark graphics=gfx/proben/#1, watermark stretch=1]
        \hspace{6mm}{\color{dunkelrot}\large\textbf{#2}}\\[0.5mm]
        \footnotesize #3
    \end{probenbox}}


\newcommand{\info}[1]{\begin{infobox}#1\end{infobox}}
\newcommand{\absatz}[1]{\subsection{#1}}
\newcommand{\unterabsatz}[1]{\subsubsection*{#1}}
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
\newcommand{\tabelle}[2]{\begin{tabularx}{\linewidth}{#1}
  \arrayrulecolor{dunkelrot}#2\end{tabularx}}

\newcommand{\tkopf}[1]{\color{dunkelrot}\cinzelbold\footnotesize\textbf{#1} }
\newcommand{\tzeile}[1]{#1 \\}


\newcommand{\zeichnung}[1]{\begin{tikzpicture}%
	\node [blend mode=multiply] at (0,0) {\includegraphics[width=\linewidth]{#1}};%
\end{tikzpicture}}
\newcommand{\bild}[1]{\includegraphics[width=\linewidth]{#1}}
\newcommand{\anfuehrungszeichen}[1]{\enquote{#1}}
\newcommand{\anf}[1]{\anfuehrungszeichen{#1}}
%\newcommand{}
\newcommand{\kastenkopf}[1]{\raggedright{\hspace{5mm}\color{dunkelrot}\Large #1}}
\newcommand{\kreaturkampfw}[4]{\kraturkampfwerte{#1}{#2}{#3}{#4}}

\newcommand{\handoutkasten}[2]{%
\neueseite
\pagestyle{empty}%
\label{#1}%
\kastengrau{
    %\kastenkopf{Kastenüberschrift}\\
    % skipleft und vspaces koennten durch einen extra handoutkasten mit mehr spacing und groessere Schrift gespart werden. Erstmal nur als Beispiel:
    \vspace{1cm}
    \setlength\leftskip{2cm}
    \setlength\rightskip{2cm}
    \huge
    #2
    \vspace{1cm}
    \setlength\leftskip{0cm}
    \setlength\rightskip{0cm}
}
}