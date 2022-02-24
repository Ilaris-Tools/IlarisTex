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


% basic config for packages
\setmainlanguage{german}
\setdefaultlanguage{german}
\tcbuselibrary{skins}

% colors
\definecolor{dunkelrot}{HTML}{450c15}
\definecolor{hellrot}{HTML}{450c15}
\definecolor{kampf}{HTML}{c86400}
\definecolor{profan}{HTML}{655743}
\definecolor{magie}{HTML}{425a66}
\definecolor{karma}{HTML}{8e5d6f}


\rowcolors{2}{brown!40}{}
%\rowcolors{2}{kampf!40}{}
% red!15!white

\makeatletter
\g@addto@macro\document{% Mehrspaltiges TOC
	\BeforeStartingTOC[toc]{\begin{multicols}{2}}%
	\AfterStartingTOC[toc]{\end{multicols}}%
}
\makeatother


\graphicspath{{gfx}{bilder}}
\newcommand{\hr}[1][0.4pt]{\par\vskip 0.4ex \hrule height #1 \par\vskip 1ex}
\newcommand{\TOCnum}{1} 


\newtcolorbox{creaturebox}[1][]{
    bicolor,
    % show bounding box,
    boxsep=0pt,
    nobeforeafter,
    top=4mm,
    arc=0mm,left=2mm,
    right=2mm,bottom=0mm,
    frame hidden,
    unbreakable,
    valign upper=bottom,
    boxrule=0pt,
    colbacklower=red!15!white,opacityback=0,
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
\linespread{0.8}

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

