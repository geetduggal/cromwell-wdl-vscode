import "everything.wdl" as everything

task test_basic {
    File pairs
    File expected
    command {
        cmp --silent ${pairs} ${expected} || exit 1
    }
}

workflow test_everything {
    File testfile
    File expected
    call everything.all as a {input: infile = testfile }
    call test_basic {input: pairs = a.out, expected = expected }
}