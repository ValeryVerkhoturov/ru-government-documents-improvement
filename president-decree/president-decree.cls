\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{president-decree}[2022/08/16 President decree]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[12pt, a4paper]{article}

\RequirePackage[english, main=russian]{babel}
\RequirePackage{fontspec}
\setmainfont{Times New Roman}

\RequirePackage{microtype}

\RequirePackage[a4paper, left=40mm, right=40mm, top=40mm, bottom=40mm]{geometry}

\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0pt}


\righthyphenmin=2

\setlength{\headheight}{15.5pt}

\RequirePackage{indentfirst}

\RequirePackage{graphicx}

\RequirePackage{enumitem}
\setlist{wide}

\RequirePackage[left={<<}, right={>>}, leftsub={„}, rightsub={“}]{dirtytalk}


\RequirePackage{fancyhdr}
\fancyhf{}
\pagestyle{fancy}
\fancyhead[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}

\RequirePackage{xfakebold}

\makeatletter
\AddEnumerateCounter{\asbuk}{\russian@alph}
\makeatother

\RequirePackage{pst-barcode}


\RequirePackage[xetex]{hyperref}
\hypersetup{pdftitle={Указ Президента Росийской Федерации}, pdfproducer={-}, pdfcreator={-}, pdfcreationdate={-}}


\newcommand*{\bigls}[1]{{\addfontfeature{LetterSpace=10}#1}}

\newcommand{\decree}[1]{
	\begin{center}
		\thispagestyle{empty}
		
		\vspace*{-40mm}
		\vspace*{10mm}
		
		\includegraphics[width=3cm]{../../emblem_black_bordered.pdf} \medskip
		
		\bfseries
		
		\huge УКАЗ
		\\
		\large ПРЕЗИДЕНТА РОССИЙСКОЙ ФЕДЕРАЦИИ
		\vspace*{12pt}
		
		\normalsize #1
		
	\end{center}
}

% {Name}{Day}{Month}{Year}{Document number}{barcode}
\newcommand{\edecree}[6]{
	\makeatletter
		\newcommand*{\@day}{#2}
		\newcommand*{\@month}{#3}
		\newcommand{\@year}{#4}
		\newcommand*{\@documentnumber}{#5}
	\makeatother
	
	\filbreak
	\vspace*{3cm}
	{
		\raggedleft
		\begin{tabular}{cc}
			Президент & \\
			Российской Федерации & #1
		\end{tabular} \smallskip\\
	}
	{	
		\raggedright
		Москва, Кремль \\
		#2~#3 #4~г. \\
		\textnumero~#5
	}
	\fancypagestyle{endstyle}{
		\fancyhf{}
		\setlength{\footskip}{75pt}
		\fancyhead[C]{\thepage}
		\fancyfoot[C]{
			%\psframebox{
			\begin{pspicture}(31mm, 24.5mm)
				\psbarcode{#6}{includetext textfont=Times-Roman}{ean13}
			\end{pspicture}
			%}
		}
	}
	\thispagestyle{endstyle}
	\clearpage
}


\newcommand*{\addition}[3]{
	\clearpage
	\pagestyle{empty}
	\begin{flushright}
		\begin{tabular}{c}
			\MakeUppercase{#1} \vspace*{3pt}\\
			Указом Президента \\ 
			Российской Федерации \\
			\makeatletter
			от~\@day~\@month{} \@year~г. \textnumero~\@documentnumber \\
			\makeatother
		\end{tabular}
	\end{flushright}
	\begin{center}
		\bfseries \MakeUppercase{#2} \\ #3
	\end{center}
	\par
}

\newcommand{\eaddition}{
	\begin{center}
		\rule{25mm}{0.4pt}
	\end{center}
	\clearpage
}

