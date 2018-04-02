\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancyslides}[2013/04/23 my custom beamer slides class]

\LoadClass{beamer}


%%%% this is a~custom class for preparing presentations
%%%% contact me if anything goes wrong
%%%% or you want to contribute to the work
%%%% pawel.lupkowski@gmail.com
%%%% release: 24.05.2013






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% PACKAGES %%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{framed}    %% FOR FRAMED SLOGANS
\RequirePackage{tikz}      %% FOR POINTED SLOGANS
\RequirePackage{shapepar}  %% FOR TEXT FITTING TO SHAPE
\usetikzlibrary{shapes.geometric}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{textcomp}
\RequirePackage{graphicx}

%%% redefines points for itemize
\setbeamertemplate{itemize items}{$\bullet$}
\newcommand{\fitem}[1]{$\bullet$~#1\newline}
\newcommand{\pitem}[1]{$\bullet$~#1\newline \pause}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% COLOURS            %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{white}{rgb}{1,1,1}
\definecolor{black}{rgb}{0,0,0}
\definecolor{gray}{rgb}{0.90196079, 0.90196079, 0.90196079}
\definecolor{blue}{rgb}{0.12941177, 0.45882353, 0.60784316}
\definecolor{green}{rgb}{0.44313726 0.78431374 0.21568628}
\definecolor{orange}{rgb}{1 0.49803922 0.16470589}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%    Slide Title     %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\ftitle}[1]{
	\begin{textblock}{30}(1,1)
		\Large{\textbf{\texttt{\MakeTextUppercase{#1}}}}
	\end{textblock}
}

\newcommand{\fsubtitle}[1]{
	\begin{textblock}{30}(1,2)
		\large{\texttt{\color{\subtitlecolor}#1}}
	\end{textblock}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% FRAMES FOR SLOGANS %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\slogan}[1]{\color{white}\Huge\texttt{\textbf{\MakeUppercase{#1}}}} %text inside boxes and dots

% strcoltxt colored Text on strcolorbkg colored Background
\newenvironment{mybox}{
	\pgfsetfillopacity{\structureopacity}
	\def\FrameCommand{\fboxsep=1cm \colorbox{\strcolorbkg}}
	\color{\strcolortxt}\MakeFramed {\FrameRestore}}
{\endMakeFramed}

\newenvironment{mybox2}{%
	\def\FrameCommand{\fboxsep=1cm \colorbox{white}}%
	\color{black}\MakeFramed {\FrameRestore}}%
{\endMakeFramed}

\newcommand{\customtextcol}[1]{#1} %text inside boxes and dots

% Frame Background
\newcommand{\fbckg}[1]{\usebackgroundtemplate{\includegraphics[width=\paperwidth]{#1}}}

\newcommand{\thankyou}{\pointedsl{thank you}} %% thank you slide

%%% defines pointed slogan
\newcommand{\pointedsl}[2]{
	\pgfsetfillopacity{\structureopacity}
	\begin{center}
		\tikz{ \fill[#1] (0,0) circle (20ex);
			\pgfsetfillopacity{1}
			\node at (0,0) {{\slogan{#2}}};
		}
	\end{center}
}


%%% defines framed slogan
\newcommand{\framedsl}[1]{
\pgfsetfillopacity{\structureopacity}
  \begin{mybox}
\pgfsetfillopacity{1}
\begin{center}
  {\slogan{#1}}
\end{center}
\end{mybox}
}


%%% itemised list frame
\newcommand{\itemized}[1]{
\pgfsetfillopacity{\structureopacity}
  \begin{mybox}
\pgfsetfillopacity{1}
\begin{Large}
\begin{itemize}
\centering
\pgfsetfillopacity{1}
#1
\end{itemize}
\end{Large}
\end{mybox}
}


%%% starting slide
\newcommand{\startingslideone}[1]{
	\begin{frame}
		\pgfsetfillopacity{\structureopacity}
		\begin{mybox}
			\pgfsetfillopacity{1}
			\begin{center}
				{\Huge \titlephrase}
			\end{center}
		\end{mybox}

		\vspace{-1.5cm}

		\pgfsetfillopacity{0.60}
		\begin{mybox2}
			\pgfsetfillopacity{0.80}
			\name \ $\bullet$ \  \affil \ $\bullet$ \ \email
		\end{mybox2}
	\end{frame}
}

\newcommand{\startingslidetwo}[1]{
	\fbckg{smile_cluster.jpg}
	\begin{frame}[plain,noframenumbering] % plain=no page number
		\pgfsetfillopacity{\structureopacity}
		\begin{center}
			\vspace{1em}
			\tikz{ \fill[\strcolortitle] (0,0) circle (20ex);
				\pgfsetfillopacity{1}}
		\end{center}
		\begin{textblock}{40}(3.7,5.5)
			\titlephrase
		\end{textblock}
		\begin{textblock}{40}(3.6,10)
			%\centering
			\large{\textbf{\texttt{{\color{white}
			\hspace{0em}\name \\
			\hspace{-0.1em} \affil \\
			\hspace{1em} \email}
			}}}
		\end{textblock}
	\end{frame}
}

%%% misc slide: for putting different stuff into it
\newcommand{\misc}[1]{
	\pgfsetfillopacity{\structureopacity}
	\begin{mybox}
		\pgfsetfillopacity{1}
		\begin{center}
			#1
		\end{center}
	\end{mybox}
}


%%% sources slide
\newcommand{\sources}[1]{
\pgfsetfillopacity{\structureopacity}
\begin{mybox}
\begin{block}{{\Huge \bf SOURCES}}
\pgfsetfillopacity{1}
~\\
#1
\end{block}
\end{mybox}  
}



\endinput
