bindgen_opt='--opaque-type FILE'

headers=`ls faiss/c_api/*_c.h faiss/c_api/impl/*_c.h faiss/c_api/utils/*_c.h`
echo '// Auto-generated, do not edit!' > c_api.h
for header in $headers; do
    echo "#include \""$header"\"" >> c_api.h;
done

cmd="bindgen --rust-target 1.33 $bindgen_opt c_api.h -o src/bindings.rs"
echo ${cmd}
${cmd}

rm -f c_api.h
