% This document provides a simple class for creating a review in Latex. It is based on the class texMemo from Rob Oakes.
%
% Original author: Rob Oakes, Copyright 2010. Originally released under the LGPL, version 3.
% Modified by Simone Scardapane, Copyright 2015. Released under the GPL, version 3. A copy can be found here:
% http://www.gnu.org/licenses/gpl-3.0.html

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{texReview}[2014/11/10 - Simple Review Class, Including Logo]
\RequirePackage{palatino}

% Basic graphic package
\usepackage[pdftex]{graphicx}
\DeclareGraphicsExtensions{.pdf,.jpeg,.jpg,.png}

% Load the Base Class
\LoadClassWithOptions{article}

% Begin Requirements
\RequirePackage{ifthen}

% Used for the table of contents spacing
\RequirePackage{tocloft}

% Size definitions
\newcommand{\titlesize}{\LARGE}

% Specialized review Commands (Journal, ID, Authors)

% Title of the article to be reviewed
\def\@revtitle{\relax}
\newcommand{\revtitle}[1]{\gdef\@revtitle{#1}}

% Title of the journal
\def\@revjournal{\relax}
\newcommand{\revjournal}[1]{\gdef\@revjournal{#1}}

% ID of the article
\def\@revid{\relax}
\newcommand{\revid}[1]{\gdef\@revid{#1}}

% Authors of the article
\def\@revauthors{\relax}
\newcommand{\revauthors}[1]{\gdef\@revauthors{#1}}

% Logo of the journal
\def\@revlogo{\relax}
\newcommand{\revlogo}[1]{\gdef\@revlogo{\protect #1}}

% Custom Document Formatting
\newcommand\decorativeline[1][1pt]{
	\par\noindent%
	\rule[0.5ex]{\linewidth}{#1}\par
}

% Set the Paper Size and margins
\RequirePackage{geometry}
\geometry{margin=1.0in}

% Colored box
\RequirePackage{tcolorbox}

% Footer
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\cfoot{\begin{footnotesize}The information contained in this document is strictly confidential and is intended for the original authors and the editorial staff of \textit{\@revjournal} only.\end{footnotesize}}
\lhead{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}

% Create the header block
\renewcommand{\maketitle}{\makereviewtitle}
\newcommand\makereviewtitle{
	\ifthenelse{\equal{\@revlogo}{\relax}}{}
	{ % Create With Logo
	\begin{minipage}[t]{1\columnwidth}%
		\begin{flushright}
			\vspace{-0.6in}
			\@revlogo
			\vspace{0.5in}
		\par\end{flushright}%
	\end{minipage}
	}
	{\begin{center}
	\titlesize\bf
	R\textsc{eview of `\@revtitle'}
	\end{center}}
	\vspace{1em}
	\begin{tcolorbox}
	\begin{description}
		\ifthenelse{\equal{\@revjournal}{\relax}}{}{\item [{Submitted To:}] \textit{\@revjournal}}
		\ifthenelse{\equal{\@revid}{\relax}}{}{\item [{Article ID:}] \@revid}
		\ifthenelse{\equal{\@revauthors}{\relax}}{}{\item [{Authors:}] \@revauthors}
	\end{description}
	\end{tcolorbox}
}

% Define the table of contents
\renewcommand*\contentsname{Summary of the review}
\setcounter{secnumdepth}{0}
\setlength\cftbeforesecskip{0pt}
\newcommand{\revtoc}{
\noindent\hrulefill\vspace{-0.5em}
\tableofcontents
\noindent\hrulefill}

% Logo commands
\newcommand{\ieeelogo}{\includegraphics[width=0.2\textwidth]{Logos/ieee_logo}}
\newcommand{\elsevierlogo}{\includegraphics[width=0.13\textwidth]{Logos/elsevier_logo}}
\newcommand{\springerlogo}{\includegraphics[width=0.13\textwidth]{Logos/springer_logo}}

% Journal commands
\newcommand{\ieeetnnls}{IEEE Transactions on Neural Networks and Learning Systems}
\newcommand{\ieeecyb}{IEEE Transactions on Cybernetics}
\newcommand{\ins}{Information Sciences}
\newcommand{\neunet}{Neural Networks}
\newcommand{\cim}{IEEE Computational Intelligence Magazine}
\newcommand{\cecn}{Cognitive Computation}
\newcommand{\soco}{Soft Computing}

% Syntactic change
\newcommand{\newtypo}[3]{\textbf{#1}: ``#2'' $\rightarrow$ ``#3''}