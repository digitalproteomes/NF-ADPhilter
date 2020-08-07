if(params.help) {
    log.info ""
    log.info "ADPhilter workflow"
    log.info "--------------------"
    log.info ""
    log.info ""
    exit 1
}



process adphilterHcd {
    publishDir 'Results/ADPhilterHcd', mode: 'link'

    input:
    file mzXML from file("${params.dda_folder}/*.mzXML")
    
    output:
    file '*.mzXML'

    """
    python /usr/local/src/ADPhilter/ADPhilterMain.py --input_file $mzXML \
    --output_file ${mzXML.baseName}_hcd_no_diag.mzXML \
    --activation ${params.hcd_activation} \
    --min_diagnostic_match ${params.hcd_min_diagnostic_match} \
    ${params.hcd_params}
    """
}


process adphilterEtd {
    publishDir 'Results/ADPhilterEtd', mode: 'link'

    input:
    file mzXML from file("${params.dda_folder}/*.mzXML")
    
    output:
    file '*.mzXML'

    """
    python /usr/local/src/ADPhilter/ADPhilterMain.py --input_file $mzXML \
    --output_file ${mzXML.baseName}_etd.mzXML \
    --activation ${params.etd_activation}  \
    --min_diagnostic_match ${params.etd_min_diagnostic_match} \
    ${params.etd_params}
    """
}
