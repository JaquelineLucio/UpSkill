const cursos = [
    { "ISBN": 0, "titulo": "HTML5, CSS3, JavaScript para Principiantes", "autor": "Zé dos Anzóis", "preco": 250, "promocao": 15, "rating": 3, "imagem": "img/curso1.jpg" },
    { "ISBN": 1, "titulo": "Curso de Comida Vegetariana", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso2.jpg" },
    { "ISBN": 2, "titulo": "Guitarra para Principiantes", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso3.jpg" },
    { "ISBN": 3, "titulo": "A horta em casa", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso4.jpg" },
    { "ISBN": 4, "titulo": "Decoracão com produtos artesanais", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso5.jpg" },
    { "ISBN": 5, "titulo": "Web para Principiantes", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso1.jpg" },
    { "ISBN": 6, "titulo": "Comida Mexicana para Principiantes", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso2.jpg" },
    { "ISBN": 7, "titulo": "Estudio Musical Em Casa", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso3.jpg" },
    { "ISBN": 8, "titulo": "Cozinha as tuas proprias frutas e verduras", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso4.jpg" },
    { "ISBN": 9, "titulo": "Preparar biscoitos caseiros", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso5.jpg" },
    { "ISBN": 10, "titulo": "JavaScript Moderno com ES6", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso1.jpg" },
    { "ISBN": 11, "titulo": "100 Receitas de Comida Natural", "autor": "Zé dos Anzóis", "preco": 200, "promocao": 15, "rating": 3, "imagem": "img/curso2.jpg" }
]
window.addEventListener('load', carregar);

function carregar() {
    desenhaCarrinhoEfavorito();
    carregarCursos();
    itemFavorito();
    itemCarrinho(); 
    maisVendidos();
}
//variaveis de armazenamento localstorage
const arrayCarrinho = JSON.parse(localStorage.getItem('carrinho')) || [];
const arrayFavorito = JSON.parse(localStorage.getItem('favorito')) || [];

function desenhaCarrinhoEfavorito() {
    let carrinhoFavorito = document.getElementById('carrinhoFavorito');

    let ul = document.createElement('ul');
    carrinhoFavorito.appendChild(ul);

    for (i = 0; i < 2; i++) {
        let cf;
        if (i == 0) { cf = 'favorito' } else if (i == 1) { cf = 'carrinho' }

        let li = document.createElement('li');
        li.className = 'submenu';
        ul.appendChild(li);

        let imgIcon = document.createElement('img');
        imgIcon.src = 'img/' + cf + '.png';
        imgIcon.id = 'img-' + cf;
        li.appendChild(imgIcon);

        let divIcon = document.createElement('div');
        divIcon.id = cf;
        li.appendChild(divIcon);

        let tableIcon = document.createElement('table');
        tableIcon.className = 'u-full-width';
        divIcon.appendChild(tableIcon);

        let theadIcon = document.createElement('thead');
        tableIcon.appendChild(theadIcon);

        let trIcon = document.createElement('tr');
        theadIcon.appendChild(trIcon);

        let th1 = document.createElement('th');
        trIcon.appendChild(th1);
        th1.textContent = 'Foto';

        let th2 = document.createElement('th');
        trIcon.appendChild(th2);
        th2.textContent = 'Nome';

        let th3 = document.createElement('th');
        trIcon.appendChild(th3);
        th3.textContent = 'Preço';

        if (cf == 'carrinho') {
            let th4 = document.createElement('th');
            trIcon.appendChild(th4);
            th4.textContent = 'Quantidade';
        }

        let tableCurso = document.createElement('table');
        tableCurso.id = 'lista-' + cf;
        tableCurso.className = 'u-full-width';
        divIcon.appendChild(tableCurso);

        //finalizar compra
        if (cf == 'carrinho') {
            let buttonComprar = document.createElement('button');
            buttonComprar.id = 'finalizarCompra';
            buttonComprar.className = 'button u-full-width';
            buttonComprar.textContent = 'Finalizar compra';
            divIcon.appendChild(buttonComprar);
            buttonComprar.addEventListener("click", function vendidos(){
               let  compra = JSON.parse(localStorage.getItem('carrinho'));
               console.table(compra)
                    compra.sort(function (a, b){
                        if(a.quantidade > b.quantidade){
                            return -1;
                        }else{
                            return true;
                        }
                    });
                    console.table(compra);
               localStorage.setItem('vendidos', JSON.stringify(compra));
               limparCar();
               maisVendidos();
            })
        }
        //limpar
        let buttonLimpar = document.createElement('button');
        buttonLimpar.id = 'limpar' + cf;
        buttonLimpar.className = 'button u-full-width';
        buttonLimpar.textContent = 'Limpar ' + cf;
        if (buttonLimpar.id == 'limparfavorito') {
            buttonLimpar.addEventListener("click", limparFav);

        } else if (buttonLimpar.id == 'limparcarrinho') {
            buttonLimpar.addEventListener("click", limparCar);
        }
        divIcon.appendChild(buttonLimpar);
    }
}

function carregarCursos() {
    let lista = document.getElementById('lista-cursos')
    //indice referencia aos cursos
    cursos.ISBN = [0];
    //indice das linhas
    for (ir = 1; ir < 5; ir++) {
        var row = document.createElement('div');
        row.id = 'row' + ir;
        row.className = 'row';
        lista.appendChild(row);
        //indice das colunas
        for (ic = 1; ic < 4; ic++) {
            desenhoCadaCurso(cursos.ISBN);
            cursos.ISBN++;
        }
    }
}

function desenhoCadaCurso(curso) {
    let row = document.getElementById('row' + ir);

    var divCol = document.createElement('div');
    divCol.className = 'four columns';
    row.appendChild(divCol)

    var divCard = document.createElement('div');
    divCard.className = 'card';
    divCol.appendChild(divCard)

    var img1 = document.createElement('img')
    img1.src = 'img/curso' + (curso + 1) + '.jpg';
    img1.id = 'img' + curso;
    img1.className += 'imagen-curso u-full-width';
    divCard.appendChild(img1);

    var divInfoCard = document.createElement('div');
    divInfoCard.className = 'info-card';
    divCard.appendChild(divInfoCard);

    var titulo = document.createElement('h4');
    titulo.id = 'titulo';
    titulo.innerText = cursos[curso].titulo;
    divInfoCard.appendChild(titulo);

    var autor = document.createElement('p');
    autor.id = 'autor';
    autor.innerText = cursos[curso].autor;
    divInfoCard.appendChild(autor);
    //
    var rating = document.createElement('img');
    rating.id = 'rating';
    rating.src = 'img/estrelas.png';
    divInfoCard.appendChild(rating);

    var preco = document.createElement('p');
    preco.className = 'preco';
    preco.innerText = cursos[curso].preco;
    divInfoCard.appendChild(preco);
    //
    var promocao = document.createElement('span');
    promocao.className = 'u-pull-right';
    promocao.innerText = cursos[curso].promocao + '€';
    preco.appendChild(promocao);

    let buttonCurso = document.createElement('button');
    buttonCurso.id = curso;
    buttonCurso.textContent = 'Adicionar ao carrinho';
    buttonCurso.className = 'u-full-width button-primary button input adicionar-carrinho';
    divInfoCard.appendChild(buttonCurso);
    buttonCurso.addEventListener("click", function listaCarrinho() {
        //check se curso ja esta no carrinho
        if (!(arrayCarrinho.some((item) => item.ISBN == curso))) {
            const item = cursos.find((item) => item.ISBN == curso)
            arrayCarrinho.push({
                ...item,
                quantidade: 1,
            });
        } else {
            const item = arrayCarrinho.find((item) => item.ISBN == curso)
            const index = arrayCarrinho.indexOf(item);
            let quantidade = item.quantidade;
            quantidade++;
            arrayCarrinho[index] = {
                ...item,
                quantidade,
            };
            alert('Adicionado mais uma unidade ao carrinho');
        }
        localStorage.setItem('carrinho', JSON.stringify(arrayCarrinho));
        itemCarrinho();
    })
    let buttonFavorito = document.createElement('button');
    buttonFavorito.id = 'F' + curso;
    buttonFavorito.className = 'u-full-width button-secondary button input adicionar-favotito';
    divInfoCard.appendChild(buttonFavorito);
    if (arrayFavorito.some((item) => item.ISBN == curso)) {
        buttonFavorito.textContent = 'Remover dos Favoritos';
    } else {
        buttonFavorito.textContent = 'Adicionar aos favoritos';
    }
    buttonFavorito.addEventListener("click", function listaFavoritos() {
        //ver se o curso ja esta no array
        const index = arrayFavorito.indexOf(curso);
        if (arrayFavorito.some((item) => item.ISBN == curso)) {
            arrayFavorito.splice(index, 1);
            buttonFavorito.textContent = 'Adicionar aos favoritos';
            buttonFavorito.style.backgroundColor = '#a93451';
        } else {//add curso
            const itemF = cursos.find((cursos) => cursos.ISBN == curso)
            arrayFavorito.push(itemF);
            buttonFavorito.style.backgroundColor = '#741d51';
            buttonFavorito.textContent = 'Remover dos Favoritos';
        }
        localStorage.setItem('favoritos', JSON.stringify(arrayFavorito));
        itemFavorito();
    })
}

function maisVendidos(){
    let MV = document.getElementById('maisVendidos');
    MV.innerHTML = '';
    let rowMV = JSON.parse(localStorage.getItem('vendidos'));
    
    rowMV.ISBN = [0];
    var rowMaisVendidos = document.createElement('div');
    rowMaisVendidos.style.backgroundColor = '#f79c9e';
    MV.appendChild(rowMaisVendidos);
    let p = document.createElement('p');
    rowMaisVendidos.appendChild(p);
    p.innerText = 'Campeões de venda:'
   
       let p1 = document.createElement('p');
       rowMaisVendidos.appendChild(p1);
       p1.innerText = rowMV[0].titulo;
       let p2 = document.createElement('p');
       rowMaisVendidos.appendChild(p2);
       p2.innerText = rowMV[1].titulo;
       let p3 = document.createElement('p');
       rowMaisVendidos.appendChild(p3);
       p3.innerText = rowMV[2].titulo;
}

function itemFavorito() {
    let arrayFavorito = JSON.parse(localStorage.getItem('favoritos'));

    const listaFavorito = document.getElementById('lista-favorito')
    listaFavorito.innerHTML = '';

    if (arrayFavorito != null) {
        arrayFavorito.forEach((item) => {
            var trCurso = document.createElement('tr');
            trCurso.id = 'tr';
            listaFavorito.appendChild(trCurso);

            let tdimg = document.createElement('td');
            trCurso.appendChild(tdimg);

            let imgCurso = document.createElement('img');
            trCurso.appendChild(imgCurso);
            imgCurso.className = 'miniatura';
            imgCurso.src = item.imagem;
            tdimg.appendChild(imgCurso);

            let td1 = document.createElement('td');
            trCurso.appendChild(td1);
            td1.textContent = item.titulo;

            let td2 = document.createElement('td');
            trCurso.appendChild(td2);
            td2.textContent = item.promocao + '€';

            let td3 = document.createElement('td');
            trCurso.appendChild(td3);

            let deletar = document.createElement('img');
            deletar.src = 'img/lixeira.png';
            td3.appendChild(deletar);
            deletar.addEventListener("click", function deletar() {
                const index = arrayFavorito.indexOf(item);
                if (arrayFavorito.some((item) => item.ISBN == item.ISBN)) {
                    arrayFavorito.splice(index, 1);
                }
                localStorage.setItem('favoritos', JSON.stringify(arrayFavorito));
                itemFavorito();
            })
        });
    }
}

function itemCarrinho() {
    let arrayCarrinho = JSON.parse(localStorage.getItem('carrinho'));

    const listaCarrinho = document.getElementById('lista-carrinho')
    listaCarrinho.innerHTML = '';
    let total = 0;

    if (arrayCarrinho != null) {
        arrayCarrinho.forEach((item) => {
            var trCurso = document.createElement('tr');
            trCurso.id = 'tr';
            listaCarrinho.appendChild(trCurso);

            let tdimg = document.createElement('td');
            trCurso.appendChild(tdimg);

            let imgCurso = document.createElement('img');
            trCurso.appendChild(imgCurso);
            imgCurso.className = 'miniatura';
            imgCurso.src = item.imagem;
            tdimg.appendChild(imgCurso);

            let td1 = document.createElement('td');
            trCurso.appendChild(td1);
            td1.textContent = item.titulo;

            let td2 = document.createElement('td');
            trCurso.appendChild(td2);
            td2.textContent = item.promocao + '€';

            let td3 = document.createElement('td');
            trCurso.appendChild(td3);

            let input = document.createElement('input');
            input.setAttribute("type", "number");
            input.setAttribute("min", 1);
            input.setAttribute("max", 10);
            input.setAttribute("value", item.quantidade);
            input.style.maxWidth = '5em';
            input.id = 'qtdd' + item.ISBN;
            td3.appendChild(input);
            input.addEventListener('change', function add() {
                const index = arrayCarrinho.indexOf(item);
                let quantidade = this.value;
                arrayCarrinho[index] = {
                    ...item,
                    quantidade,
                };
                localStorage.setItem('carrinho', JSON.stringify(arrayCarrinho));
                itemCarrinho();
            })

            let td4 = document.createElement('td');
            trCurso.appendChild(td4);

            let deletar = document.createElement('img');
            deletar.src = 'img/lixeira.png';
            td4.appendChild(deletar);
            td4.addEventListener("click", function deletar() {
                const index = arrayCarrinho.indexOf(item);
                if (arrayCarrinho.some((item) => item.ISBN == item.ISBN)) {
                    arrayCarrinho.splice(index, 1);
                }
                localStorage.setItem('carrinho', JSON.stringify(arrayCarrinho));
                itemCarrinho();
            })

            let subTotal = (item.promocao * item.quantidade);
            subTotal.id = 'subtotal' + item.ISBN;
            total = total + subTotal;
        })//forEach
    };//if != null
    var trTotal = document.createElement('tr');
    trTotal.id = 'trTotal';
    trTotal.className = 'u-full-width button';
    trTotal.style.marginTop = '1em';
    listaCarrinho.appendChild(trTotal);
    trTotal.textContent = 'Valor total: ' + total + '€';
}//função

function limparFav() {
    localStorage.removeItem('favoritos');
    itemFavorito();
}

function limparCar() {
    localStorage.removeItem('carrinho');
    itemCarrinho();
}