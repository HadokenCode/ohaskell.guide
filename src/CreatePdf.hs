{-# LANGUAGE OverloadedStrings #-}

module CreatePdf (
      createPdfDesktop
    , createPdfMobile
) where

import System.Process (callCommand)

createPdfDesktop :: FilePath -> IO ()
createPdfDesktop pathToSingleMarkdown =
    callCommand $ concat [ "pandoc --latex-engine="
                         , pdfEngine
                         , " --template="
                         , template
                         , " -V fontsize=\"11pt\""
                         , " -V classoption=\"oneside\""
                         , " -V geometry=\"margin=1.2in\""
                         , " -V geometry=\"headsep=0.5in\""
                         , " -V geometry=\"paper=a4paper\""
                         , " -o "
                         , outDesktop
                         , " "
                         , pathToSingleMarkdown
                         ]

createPdfMobile :: FilePath -> IO ()
createPdfMobile pathToSingleMarkdown =
    callCommand $ concat [ "pandoc --latex-engine="
                         , pdfEngine
                         , " --template="
                         , template
                         , " -V fontsize=\"12pt\""
                         , " -V classoption=\"oneside\""
                         , " -V geometry=\"headsep=0.3in\""
                         , " -V geometry=\"top=0.75in\""
                         , " -V geometry=\"bottom=0.8in\""
                         , " -V geometry=\"left=0.3in\""
                         , " -V geometry=\"right=0.3in\""
                         , " -V geometry=\"paper=a5paper\""
                         , " -o "
                         , outMobile
                         , " "
                         , pathToSingleMarkdown
                         ]

pdfEngine, template, outDesktop, outMobile :: String
pdfEngine  = "xelatex"
template   = "pdf/template.tex"
outDesktop = "pdf/ohaskell.pdf"
outMobile  = "pdf/ohaskell-mobile.pdf"

