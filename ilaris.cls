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

% NOTE: colorlinks+linkcolor macht links farbig statt der roten kaesten.. aber dafür kann das inhaltsverzeichnis (links) auch nicht mehr farbig unterschiedlich gestaltet werden, da link colors die tocstyles scheinbar überschreibt :(
% https://tex.stackexchange.com/questions/50747/options-for-appearance-of-links-in-hyperref
%https://ctan.mc1.root.project-creative.net/macros/latex/contrib/hyperref/doc/hyperref-doc.pdf
% hidelinks und ggf. manuell faerben mit eigenem command ist das beste bzw. einzige um volle kontrolle zu haben
\RequirePackage[bookmarks,pdfusetitle,
% colorlinks,
% linkcolor=dunkelrot,
% linktoc=none,
hidelinks,
citecolor=dunkelbraun,urlcolor=Sepia,breaklinks]{hyperref}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{polyglossia}
\RequirePackage{enumitem}
\RequirePackage{wrapfig}
\RequirePackage{multicol}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{shadowtext}
\RequirePackage{tikz} 
\RequirePackage{csquotes}
\RequirePackage{todonotes}
%\RequirePackage{fontspec}
\RequirePackage{lipsum}
\RequirePackage[breakable,skins,xparse]{tcolorbox}
\RequirePackage[top=20mm, bottom=15mm, outer=15mm, inner=15mm, marginparsep=10mm, marginparwidth=20mm, head=12.5mm, foot=8mm]{geometry}
\RequirePackage{verbatim}
\RequirePackage{fourier}
\RequirePackage[T1]{fontenc}
\RequirePackage{background}
\RequirePackage{xifthen}
\RequirePackage{xparse}
\RequirePackage[normalem]{ulem}
\RequirePackage{setspace}

% basic config for packages and layout
\setmainlanguage{german}
\setdefaultlanguage{german}
\tcbuselibrary{skins}
\linespread{0.9}
\rowcolors{2}{}{brown!55}


\setitemize{label={\raisebox{-1mm}{\includegraphics[width=3mm]{gfx/layout/bulletpoint.png}}}}
%\setdescription{itemsep=0cm}
%\setenumerate{itemsep=0cm}


%\renewcommand{\cleardoublepage}{\clearpage}

\makeatletter
\g@addto@macro\document{% Mehrspaltiges TOC
	\BeforeStartingTOC[toc]{\begin{multicols}{2}}%
	\AfterStartingTOC[toc]{\end{multicols}}%
}
\makeatother


\graphicspath{{gfx/}{bilder/}}
%\newcommand{\TOCnum}{1} 


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
    width=\linewidth,
	arc=0mm, unbreakable,
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
\DeclareDocumentCommand\rahmenklein{ O{\linewidth} m }{%
	\vspace{5mm}
    \makebox[\linewidth][c]{%
      \begin{minipage}{15cm}
	\begin{bildbox}[overlay={%
			\node[anchor=center, inner sep=0] at (frame.center) {\includegraphics[width=0.98\linewidth, keepaspectratio]{#2}};
			%\node[anchor=north east] at ([xshift=1.5mm, yshift=5.6mm]frame.north east) {\includegraphics[width=30mm, keepaspectratio]{gfx/kasten/eckeor.png}};
			\node[anchor=north east] at ([xshift=4.8mm, yshift=5.6mm]frame.north east) {\includegraphics[angle=180,origin=c,width=30mm, keepaspectratio]{gfx/kasten/ecke.png}};
			\node[anchor=south west] at ([xshift=-4.8mm, yshift=-5.6mm]frame.south west) {\includegraphics[width=30mm, keepaspectratio]{gfx/kasten/ecke.png}};
		}]
	\noindent\phantom{\includegraphics[width=\linewidth, keepaspectratio]{#2}}
	\end{bildbox}
\end{minipage}}%
	%\vspace{5mm}
	\leavevmode
}
\newtcolorbox{kartenbox}[1][]{
    unbreakable,
    blankest,
    halign=left,
    nobeforeafter,
    top=5mm,
    left=5mm,
    right=5mm,
    bottom=5mm,
    watermark graphics=gfx/kasten/karte.jpg, 
    watermark stretch=1,
    width=63mm,
    height=88mm,
    #1
}
\newcommand{\karte}[1]{\begin{kartenbox}#1\end{kartenbox}}

% layout
\setlength\parindent{0pt}% noindent anywhere
\setcounter{secnumdepth}{0}% no section numbers
\renewcaptionname{german}{\contentsname}{Inhalt}
% \cehead*{
% 	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}};
% 	}
% \cohead*{% odd pages
% 	\tikz[remember picture,overlay] \node[inner sep=0pt] at (current page.center){\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund.jpg}}; 
% 	}
\ofoot*{\qquad\textbf{\normalfont\LARGE\thepage}\qquad}

\newcommand{\bgscale}{1} % quickfix to disable bg

%Hintergundbild
\SetBgContents{}
\SetBgOpacity{1}
\makeatletter
\AddEverypageHook{%
\ifthenelse{\isodd{\thepage}}%
{\SetBgAngle{0}%
\SetBgScale{1}
\SetBgContents{\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund}}}%
{\SetBgAngle{0}%
\SetBgScale{1}
\SetBgContents{\scalebox{-1}[1]{\includegraphics[width=\paperwidth,height=\paperheight]{gfx/layout/hintergrund}}}}%
\bg@material}
\makeatother


% fonts
%%% FONTSPEC %%%
% \defaultfontfeatures[DancingScript]{
%     Extension={.ttf}, 
%     UprightFont={*-Regular},
%     BoldFont={*-Bold},
%     ItalicFont={*-Italic},
%     BoldItalicFont={*-BoldItalic},
% }

\newfontfamily{\aniron}{Aniron-Bold.ttf}
\newfontfamily{\handschrift}{DancingScript-Regular.ttf}
\newfontfamily{\krakelschrift}{MsMadi-Regular.ttf}
\newfontfamily{\crimsonblack}{CrimsonPro-Black.ttf}
\newfontfamily{\cormorantsc}{cormorant.sc.otf}
\newfontfamily{\cormorantscbold}{cormorant.sc-bold.otf}
% \newfontfamily{\cinzel}{Cinzel-Regular.ttf}
% \newfontfamily{\cinzelbold}{Cinzel-Bold.ttf}
% \newfontfamily{\cinzelsemi}{Cinzel-SemiBold.ttf}
% \newfontfamily{\pagella}{texgyrepagella-regular.otf}
% \newfontfamily{\neutonscbold}{neuton.sc-bold.ttf} % no sc?
% \newfontfamily{\frenchbold}{im-fell-french-canon.bold.ttf}
% \newfontfamily{\playfairbold}{PlayfairDisplaySC-Bold.ttf}
% \newfontfamily{\alegreyabold}{AlegreyaSC-Bold.ttf}
% \newfontfamily{\kartentext}[SizeFeatures={Size=8}]{qpl}%{b}{sc}


\setmainfont[
    BoldFont=CrimsonPro-Bold.ttf, 
    ItalicFont=CrimsonPro-Italic.ttf, 
    BoldItalicFont=CrimsonPro-BoldItalic.ttf
    ]{CrimsonPro-Regular.ttf}
\setsansfont{CrimsonPro-Regular.ttf}
\addtokomafont{chapter}{\color{dunkelrot}\fontsize{26}{26}\aniron}
\setkomafont{chapterentry}{\LARGE \scshape \cormorantscbold \color{dunkelrot}}
\setkomafont{chapterentrypagenumber}{\normalsize}
\setkomafont{section}{\aniron\Large\color{dunkelrot}}
%\setkomafont{subsection}{\Large \cormorantscbold \color{dunkelrot}}
\setkomafont{subsection}{\Large \cormorantscbold \color{dunkelrot}}
\setkomafont{subsubsection}{\cormorantscbold \color{dunkelrot}}
\addtokomafont{minisec}{\normalfont\bfseries}

\newcommand*\tocsubsection[1]{{\color{black}#1}}

\RedeclareSectionCommand[beforeskip=1em,afterskip=1.5em,
tocentryformat=\color{dunkelrot}\cormorantscbold\LARGE
]{chapter}
\RedeclareSectionCommand[beforeskip=1.5em,afterskip=0.5em,%
tocentryformat=\color{dunkelrot}\cormorantscbold
    %tocpagenumberformat=\usekomafont{disposition}
]{section}
\RedeclareSectionCommand[beforeskip=1em,afterskip=0.1em,%
tocentryformat=\tocsubsection]{subsection}
%\RedeclareSectionCommand[beforeskip=0em,afterskip=0.1em]{subsubsection}
\RedeclareSectionCommand[beforeskip=1em,afterskip=0.1em]{subsubsection}


% \newcommand*\tocentryformat[1]{{\ttfamily#1}}
% \RedeclareSectionCommands
%   [
%     tocentryformat=\tocentryformat,
%     tocpagenumberformat=\tocentryformat
%   ]
%   {section,subsection,subsubsection,paragraph,subparagraph}


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
\newcommand{\wiki}[1]{%
    \link{https://de.wiki-aventurica.de/wiki/#1}{#1}%
  }
\newcommand{\link}[2]{\href{#1}{\uline{#2}}} 
\newcommand{\hr}[1][0.4pt]{\par\vskip 0.4ex {\color{dunkelrot}\hrule height #1 }\par\vskip 1ex}
\newcommand{\trennlinie}{\vspace{2mm}\hr\vspace{2mm}}
\newcommand{\linie}{\hr}
\newcommand{\anfang}{\raggedcolumns\frontmatter\raggedright}
\newcommand{\hauptteil}{\mainmatter\pagestyle{plain}}
\newcommand{\schluss}{\backmatter}
\newcommand{\spaltenanfang}{\begin{multicols}{2}}
\newcommand{\dreispaltenanfang}{\begin{multicols}{3}}
\newcommand{\spaltenende}{\end{multicols}}
\newcommand{\skapitel}[1]{\end{multicols}\kapitel{#1}\begin{multicols}{2}}
\newcommand{\kapitel}[1]{{\let\cleardoublepage\clearpage\chapter*{#1}}\addcontentsline{toc}{chapter}{#1}}
\newcommand{\kapitelihvz}[2]{\let\cleardoublepage\clearpage\chapter*{#1}\addcontentsline{toc}{chapter}{#2}}
\newcommand{\abschnitt}[1]{\section{#1}}
\newcommand{\leereseite}{\newpage\makebox{}\clearpage}
\newcommand{\platz}{\vfill}
\newcommand{\begriff}[1]{\textbf{#1}}
\newcommand{\geschichte}[2]{%
    \smallskip
    \begin{center}
        \begin{minipage}[b]{0.9\linewidth}{\textit{#1}}
            \begin{flushright}--- #2 \end{flushright}
        \end{minipage}
    \end{center}
	\smallskip}
\newcommand{\kasten}[1]{\begin{pergamentbox}#1\end{pergamentbox}}
\newcommand{\kastengrau}[1]{\begin{pergamentboxgrau}#1\end{pergamentboxgrau}}
\newcommand{\inhaltsverzeichnis}{{\let\cleardoublepage\clearpage\tableofcontents}}
\newcommand{\grobesinhaltsverzeichnis}{\setcounter{tocdepth}{1}\grobesinhaltsverzeichnis}
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
    \title{#1}{%
    %\begin{centering}
        % 26.12.2020 \\
        % \color{orange!15}
        %\center
        \color{\tfarbe}%
        %\vspace{0.55\textheight}
        %\Huge
        %\fontfamily{\aniron}
        \fontsize{42}{42}%
        %\selectfont
        \aniron%
        \shadowcolor{\tsfarbe}%
        \shadowtext{ #1}
        }
    %\end{centering}
}

\newcommand{\autorin}[1]{\begin{centering}\author{#1}\Large #1\\\end{centering}}
\newcommand{\autor}[1]{\autorin{#1}}
\newcommand{\titelseite}[1]{\thispagestyle{empty}#1}
%\newcommand{\kreatur}[1]{\begin{creature}#1\end{creature}}


\newcommand{\probe}[3]{%
    \begin{probenbox}[watermark graphics=gfx/proben/#1, watermark stretch=1]
        %\hspace{6mm}{\color{dunkelrot}\large\textbf{#2}}\\[0.5mm]
        \parbox{5.2cm}{\centering \color{dunkelrot}\large\textbf{#2}}\\[0.5mm]
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
\newcommand{\ohnehintergrund}{\SetBgOpacity{0}}
\newcommand{\mithintergrund}{\SetBgOpacity{1}}
\newcommand{\credit}[2]{%
    \begin{center}
        {\cormorantscbold\large\color{dunkelrot}#1}\\
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

% Kreaturen
\newcommand{\kreatur}[4]{%
    \begin{creaturebox}
        \begin{minipage}[b]{0.86\linewidth}
            {\cormorantscbold\Large\color{dunkelrot} #1}\\[0mm]
            %\footnotesize 
            \emph{#2}
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
\newcommand{\kreaturinfo}[2]{
    \footnotesize\textbf{#1: }\hangindent=5mm \hangafter1 #2\par}

\newcommand{\kreaturWsMrGsIni}[4]{
    \kreaturkampfwert{Wundschwelle}{#1}
    \kreaturkampfwert{Magieresistenz}{#2}
    \kreaturkampfwert{Geschwindigkeit}{#3}
    \kreaturkampfwert{Initiative}{#4}
}
\newcommand{\kreaturkampfwerte}[4]{\kreaturWsMrGsIni{#1}{#2}{#3}{#4}}
% \newcommand{\kreaturwaffe}[6]{
%     \textbf{#1} \hfill RW #2 \hfill VT #3 \hfill AT #4 \hfill TP #5 \par \hspace{4mm} \textit{#6}\par
% }
% \newcommand{\kreaturwaffe}[6]{
%     \parbox{9Ex}{\textbf{#1}} \hfill RW #2 \hfill VT #3 \hfill AT #4 \hfill TP #5 \par \hspace{4mm} \textit{#6}\par
% }
\newcommand{\kreaturwaffe}[6]{
    \parbox{9Ex}{\textbf{#1}} \hfill RW #2 \hfill VT #3 \hfill AT #4 \hfill TP #5 \par \hspace{4mm} {#6}
    \smallskip
    \par
}
\newcommand{\kreaturkampfwert}[2]{\kreaturinfo{#1}{#2}\par}
\newcommand{\WsMrGsIni}[4]{\kreaturkampfwerte{#1}{#2}{#3}{#4}}
\newcommand{\kreaturvorteile}[1]{#1}
\newcommand{\kreaturkampfvorteile}[1]{\kreaturinfo{Kampfvorteile}{#1}}
\newcommand{\kreaturfertigkeiten}[1]{\kreaturinfo{Fertigkeiten}{#1}}
\newcommand{\kreaturattribute}[1]{\kreaturinfo{Attribute}{#1}}
\newcommand{\kreaturvarianten}[1]{\kreaturinfo{Varianten}{#1}}
\newcommand{\tabelle}[2]{\global\rownum=0\relax\begin{tabularx}{\linewidth}{#1}
  \arrayrulecolor{dunkelrot}#2\end{tabularx}}

\newcommand{\tkopf}[1]{\color{dunkelrot}
\cormorantscbold\large\textbf{#1} }
%\newcommand{\tzeile}[1]{#1 \\}
\setlength{\arrayrulewidth}{1.5pt}


\DeclareDocumentCommand\zeichnung{ O{\linewidth} m }{%
    \begin{tikzpicture}%
        \node [blend mode=multiply] at (0,0) {\includegraphics[width=#1]{#2}};%
    \end{tikzpicture}%
}

\DeclareDocumentCommand\czeichnung{ O{\linewidth} m }{%
    \begin{centering}%
        \zeichnung[#1]{#2}
    \end{centering}
}

% \newcommand{\bild}[1]{\includegraphics[width=\linewidth]{#1}}
\DeclareDocumentCommand\bild{ O{\linewidth} m }{%
    \includegraphics[width=#1]{#2}%
}%
\newcommand{\anfuehrungszeichen}[1]{\enquote{#1}}
\newcommand{\anf}[1]{\anfuehrungszeichen{#1}}
%\newcommand{}
\newcommand{\kastenkopf}[1]{\raggedright{\hspace{5mm}\color{dunkelrot}\Large #1}}
\newcommand{\kreaturkampfw}[4]{\kraturkampfwerte{#1}{#2}{#3}{#4}}

\newcommand{\handout}{
    \ohnehintergrund
    \newgeometry{left=9mm,right=9mm,top=12mm,bottom=12mm}
    \pagestyle{empty}
}
\newcommand{\handoutende}{
    \neueseite
    \mithintergrund
    \restoregeometry
    \pagestyle{plain}
}


\DeclareDocumentCommand\handoutkasten{ O{\linewidth} m m }{%
\label{#2}%
\begin{minipage}{#1}
\kastengrau{
    %\kastenkopf{Kastenüberschrift}\\
    % skipleft und vspaces koennten durch einen extra handoutkasten mit mehr spacing und groessere Schrift gespart werden. Erstmal nur als Beispiel:
    \vspace{1cm}
    \setlength\leftskip{2cm}
    \setlength\rightskip{2cm}
    \raggedright
    #3
    \vspace{1cm}
    \setlength\leftskip{0cm}
    \setlength\rightskip{0cm}
}
\end{minipage}
}



\newcommand{\karteninhalt}[2]{\begin{center}\textbf{#1}\end{center} #2}
\newcommand{\glsinhalt}[1]{\karteninhalt{\gls{#1}}{{\footnotesize \begin{spacing}{0.8} \glsdesc{#1}\end{spacing}}}}
\newcommand{\infokarte}[2]{\karte{\karteninhalt{#1}{#2}}}
\newcommand{\infokarteklein}[2]{\karte{\karteninhalt{#1}{{\footnotesize \begin{spacing}{0.8} #2 \end{spacing}}}}}
\newcommand{\glskarte}[1]{\karte{\glsinhalt{#1}}}
\newcommand{\bildkarte}[2]{\karte{%
\parbox{5cm}{
    \centering
    \zeichnung[4.5cm]{#1}
}
#2
}}


\DeclareDocumentCommand{\symboltext}{ O{1cm} m m }{%
    \parbox{\linewidth}{
        \begin{wrapfigure}{l}{1cm}%
            \vspace{-1em}
            \includegraphics[width=\linewidth]{#2}%
            \vspace{-1.2em}
        \end{wrapfigure}
        #3
    }
}

\newcommand{\stichpunktliste}[1]{%
        \begin{itemize}#1\end{itemize}
}

\newcommand{\icon}[1]{%
    {\raisebox{-2mm}{\includegraphics[width=4mm]{#1}}}%
}

\DeclareDocumentCommand\punkt{ O{bulletpoint} }{%
    \item[\icon{gfx/icons/#1}]%
}%
% \newcommand{\stichpunkt}{\item}
% \newcommand{\punkt}{\stichpunkt}


\makeatletter 
\newcommand{\kastenname}[2][]{\phantomsection\def\@currentlabelname{\ifthenelse{\equal{#1}{}}{#2}{#1}}\label{#2}} 
\makeatother

\newcommand{\kastenlink}[1]{\nameref{#1}}