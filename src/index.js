const allDropdownContainer = document.querySelector('.all-dropdown-container');
const allRows = document.querySelectorAll('.subcategory-container');
const content = document.querySelector('.page-content');

const rows = document.querySelectorAll('.row-container');

var mainCategories = categories.filter(
	(c) => c.layout_code == null && c.body_layout == null
);
var currentCategory = mainCategories.filter((c) => c.b_current == 1)[0];
mainCategories.splice(mainCategories.indexOf(currentCategory));

var mainObj = {};

const buildMainObj = (current, source) => {
	var currentAll = [];
	source.map((c) => {
		if (
			c.s_category == current.s_category &&
			c.layout_code != null &&
			c.body_layout != null
		) {
			currentAll.push(c);
		}
	});

	let add = [];
	currentAll.map((c) => {
		if (c.s_action == 'a0') {
			add.push(c);
			console.log(add);
		}
	});
	console.log(add);
	var addCurrent = add.filter((c) => c.b_current == 1)[0];
	console.log(addCurrent);
	add.splice(add.indexOf(addCurrent));

	var edit = currentAll.filter((c) => c.s_action == 'e0');
	var editCurrent = edit.filter((c) => c.b_current == 1)[0];
	edit.splice(edit.indexOf(editCurrent));

	var list = currentAll.filter((c) => c.s_action == 'l0');
	var listCurrent = list.filter((c) => c.b_current == 1)[0];
	list.splice(list.indexOf(listCurrent));

	var tabs = currentAll.filter((c) => c.s_action == 't0');
	var tabsCurrent = tabs.filter((c) => c.b_current == 1)[0];
	tabs.splice(tabs.indexOf(tabsCurrent));

	return {
		add: add,
		addCurrent: addCurrent,
		edit: edit,
		editCurrent: editCurrent,
		list: list,
		listCurrent: listCurrent,
		tabs: tabs,
		tabsCurrent: tabsCurrent,
	};
};

mainObj = buildMainObj(currentCategory, categories);

const createCol = (add, addCurrent, place, leader) => {
	addRow = rows[place].querySelector('.category');
	addRow.innerText = addCurrent.label_txt;

	addRow.setAttribute('id', addCurrent.id);

	if (add.length > 0) {
		addRowSub = rows[place].querySelector('.subcategory-container');
		add.map((e) => {
			let subElement = document.createElement('div');
			subElement.classList.add('subcategory', 'subcat-item');
			subElement.setAttribute('id', e.id);

			if (leader) {
				subElement.classList.add('leader');
			}
			subElement.innerText = e.label_txt;
			addRowSub.appendChild(subElement);
		});
	}
};
const createCols = () => {
	createCol(mainObj.add, mainObj.addCurrent, 0, false);
	createCol(mainObj.edit, mainObj.editCurrent, 1, false);
	createCol(mainObj.tabs, mainObj.tabsCurrent, 2, false);
	createCol(mainObj.list, mainObj.listCurrent, 3, false);
	createCol(mainCategories, currentCategory, 4, true);
};

createCols();

const closeAll = () => {
	[...allRows].map((e) => {
		e.classList.add('invisible');
		e.style.display = 'none';
	});
};

allDropdownContainer.addEventListener('click', closeAll);
content.addEventListener('click', closeAll);

const handleRowClick = (element, event) => {
	const buttonClasses = event.composedPath()[0].classList;

	if (buttonClasses.contains('category')) {
		const subCatContainer = element.querySelector('.subcategory-container');
		if (subCatContainer.classList.contains('invisible')) {
			subCatContainer.classList.remove('invisible');
			subCatContainer.classList.add('open');

			subCatContainer.style.display = 'block';
		} else {
			subCatContainer.classList.remove('open');
			closeAll();
		}
	} else {
		closeAll();
	}
	//console.log(buttonClasses);
	//console.log(event.composedPath());
	//console.log(element);

	if (buttonClasses.contains('subcat-item')) {
		nextElem = event.composedPath()[0].innerText.trim();
		id = event.composedPath()[0].id;
		item = categories.filter((i) => i.id == id)[0];
		if (buttonClasses.contains('leader')) {
			//console.log(item);
			mainCategories = categories.filter(
				(c) => c.layout_code == null && c.body_layout == null
			);
			mainCategories.splice(mainCategories.indexOf(item));
			mainObj = buildMainObj(item, categories);
			//console.log(mainObj);
			createCols();
		}
	}
	/*
	if (buttonClasses.contains('cat-label-action')) {
		const button = element.querySelector('.label-text').innerText;
		console.log('Category: ' + button);
	} else if (buttonClasses.contains('subcat-item')) {
		if (event.composedPath()[0].tagName !== 'IMG') {
			console.log(
				'Selected subcategory: ' + event.composedPath()[0].innerText.trim()
			);
		} else {
			console.log(
				'Selected subcategory: ' + event.composedPath()[1].innerText.trim()
			);
		}
	}
	*/
};

delegateCategory(
	allDropdownContainer,
	'click',
	'.row-container',
	handleRowClick
);

function delegateCategory(parent, type, selector, handler) {
	parent.addEventListener(type, function (event) {
		const targetElement = event.target.closest(selector);
		if (targetElement == null) return;
		targetElement.addEventListener(type, handleRowClick(targetElement, event));
		//if (this.contains(targetElement)) handler.call(targetElement, event);
	});
}
