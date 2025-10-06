#!/bin/bash
# LaTeX 한글 문서 빌드 스크립트
# XeLaTeX를 사용하여 한글을 지원하는 PDF 생성

# 파일 이름 (확장자 제외)
FILENAME=${1:-lecture1_summary}

echo "=== Building Korean LaTeX document: ${FILENAME}.tex ==="

# XeLaTeX 실행 (목차 생성을 위해 2회 실행)
xelatex -interaction=nonstopmode "${FILENAME}.tex"
xelatex -interaction=nonstopmode "${FILENAME}.tex"

# 임시 파일 정리
echo "=== Cleaning up auxiliary files ==="
rm -f "${FILENAME}.aux" "${FILENAME}.log" "${FILENAME}.out" "${FILENAME}.toc"

# 결과 확인
if [ -f "${FILENAME}.pdf" ]; then
    echo "✅ PDF successfully generated: ${FILENAME}.pdf"
    open "${FILENAME}.pdf"
else
    echo "❌ PDF generation failed"
    exit 1
fi
