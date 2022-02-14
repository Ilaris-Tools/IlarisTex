\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Ilaris}[TeX Vorlage für Ilaris]

% inkompatibel zu Ilaris-Latex:
% ziel: eher einfach halten und nicht latex erklären extras klasse abstrahiert. latex pros koennen das weglassen/bearbeiten
% \geschichte{...} statt \begin{geschichte}...\end{geschichte}
% oder \begin{story}...\end{story}
%
% anders als ilaris original:
% seitenzahlen fangen nach inhaltsverzeichnis an

% use scrbook as baseclass and pass additional options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions\relax
\LoadClass{scrbook}

\RequirePackage[table]{xcolor}
% load and configure packages
\RequirePackage{
	% ocg-p,      % Druckebenen
	% nicefrac,   % Brüche mit schrägem Strich
	scrlayer-scrpage,
    polyglossia,
	enumitem,
	multicol,
	booktabs,
	tabularx,
    shadowtext,
	tikz,
    todonotes,
    fontspec,
    lipsum,
	% microtype   % Typografische Feinjustierung
}
\RequirePackage[breakable,skins,xparse]{tcolorbox}
\RequirePackage[bookmarks,pdfusetitle,colorlinks,linkcolor=black,citecolor=black,urlcolor=brown,breaklinks]{hyperref}
\RequirePackage[top=20mm, bottom=15mm, outer=15mm, inner=15mm, marginparsep=10mm, marginparwidth=20mm, head=12.5mm, foot=8mm]{geometry}
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
% environments
% \newenvironment{story}% name
%     {\medskip\begingroup\begin{minipage}{\textwidth}\em}% begin
%     {\end{minipage}\endgroup\aftergroup\smallskip}% end


\graphicspath{{layout/grafik/}{bilder}}
\newcommand{\hr}[1][0.4pt]{\par\vskip 0.4ex \hrule height #1 \par\vskip 1ex}
\newcommand{\TOCnum}{1} 

\newenvironment{creature}%as in ilaris-latex
    {\begingroup\bigskip\begin{minipage}{0.95\linewidth}}
    {\hr[0.8pt]\end{minipage}\endgroup\aftergroup\bigskip}

\newtcolorbox{creaturebox}[1][]{
    bicolor,
    boxsep=0pt,
    nobeforeafter,
    arc=0mm,left=2mm,
    right=2mm,bottom=0mm,
    frame hidden,
    unbreakable,
    boxrule=0pt,
    colbacklower=red!15!white,opacityback=0,
    opacitybacklower=0.5,
    middle=0mm,
    #1
}

\newtcolorbox{pergamentbox}[1][]{
    unbreakable,
    blankest,
    top=5mm,
    left=5mm,
    right=5mm,
    bottom=5mm,
    watermark graphics=layout/grafik/kasten.png, 
    watermark stretch=1,
    width=\linewidth ,
    #1	
}

% layout
\setlength\parindent{0pt}% noindent anywhere
\setcounter{secnumdepth}{0}% no section numbers
\renewcaptionname{german}{\contentsname}{Inhalt}
\cehead*{% even pages (copy from rpg-latex)
	%\begin{ocg}{Hintergrund}{1}{1}
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight]{layout/grafik/hintergrund.jpg}}};
	%\end{ocg}
	}
\cohead*{% odd pages
	%\begin{ocg}{Hintergrund}{1}{1}
	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth,height=\paperheight]{layout/grafik/hintergrund.jpg}}; 
	%\end{ocg}
	}
\ofoot*{\qquad\textbf{\normalfont\LARGE\thepage}\qquad}



% fonts
% \defaultfontfeatures{Ligatures=TeX}
\setmainfont[
			% ItalicFont=* Italic,
			% BoldItalicFont=* Bold Italic,
			% Ligatures=TeX
			]{Minion Pro}
\setsansfont{Minion Pro}
\setkomafont{chapterentry}{\LARGE \scshape \textbf}
\setkomafont{chapterentrypagenumber}{\normalfont\normalsize}
\newfontfamily{\aniron}{Aniron}
\addtokomafont{chapter}{\color{dunkelrot}\fontsize{30}{36}\aniron}
\addtokomafont{section}{\color{dunkelrot}\Large\aniron} 
\addtokomafont{subsection}{\fontsize{15}{16}\scshape} 
\addtokomafont{subsubsection}{\fontsize{12}{12}\scshape} 
\addtokomafont{minisec}{\normalfont\bfseries}


% chapter style
\RequirePackage{varwidth} %Breite anpassen für überlange Zeilen 
\renewcommand*{\raggedchapter}{\centering}
\renewcommand\chapterlinesformat[3]{%
      \scalebox{-1}[1]{\raisebox{-0.3\height}{\includegraphics[height=1.4cm]{layout/grafik/kapitel}}}%
	  \hspace{0.2em}%
      \begin{varwidth}{\dimexpr\textwidth-5em\relax}%
      %\begin{varwidth}{0.5\textwidth}%
        \raggedchapter#2#3%
      \end{varwidth}%
	  \hspace{0.2em}%
	  \raisebox{-0.3\height}{\includegraphics[height=1.4cm]{layout/grafik/kapitel}}%
      \par\nobreak
      \par
}