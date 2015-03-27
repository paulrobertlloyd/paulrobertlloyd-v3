---
layout: page
title: Forms
series: Styleguide
excerpt: A guide to the mark-up styles used throughout this site.
permalink: /styleguide/forms
---
Forms can be used when you wish to collect data from users. The `fieldset` element enables you to group related fields within a form, and each one should contain a corresponding `legend`. The `label` element ensures field descriptions are associated with their corresponding form widgets.

<div class="example">
    <form action="#">
        <fieldset>
            <legend>Legend</legend>
            <div>
                <label for="text">Text Input <abbr title="Required">*</abbr></label>
                <input id="text" class="text" type="text"/>
                <em>Note about this field</em>
            </div>
            <div>
                <label for="password">Password</label>
                <input id="password" class="text" type="password"/>
                <em>Note about this field</em>
            </div>
            <div>
                <label for="url">Web Address</label>
                <input id="url" class="text" type="url"/>
                <em>Note about this field</em>
            </div>
            <div>
                <label for="email">Email Address</label>
                <input id="email" class="text" type="email"/>
                <em>Note about this field</em>
            </div>
            <div>
                <label for="search">Search</label>
                <input id="search" class="text" type="search"/><input id="password" class="search button" type="submit"/>
                <em>Note about this field</em>
            </div>
            <div>
                <label for="textarea">Textarea</label>
                <textarea id="textarea" rows="8" cols="48"></textarea>
                <em class="clear">Note about this field</em>
            </div>
            <div>
                <label for="checkbox">Single Checkbox</label>
                <label for="checkbox" class="check"><input id="checkbox" type="checkbox" class="checkbox"/> Label</label>
            </div>
            <div>
                <label for="select">Select</label>
                <select id="select">
                    <optgroup label="Option Group">
                        <option>Option One</option>
                        <option>Option Two</option>
                        <option>Option Three</option>
                    </optgroup>
                </select>
                <em>Note about this selection</em>
            </div>
            <fieldset class="options">
                <legend>Checkbox <abbr title="Required">*</abbr></legend>
                <ul>
                    <li><label for="checkbox1"><input id="checkbox1" name="checkbox" type="checkbox" checked="checked" /> Choice A</label></li>
                    <li><label for="checkbox2"><input id="checkbox2" name="checkbox" type="checkbox" /> Choice B</label></li>
                    <li><label for="checkbox3"><input id="checkbox3" name="checkbox" type="checkbox" /> Choice C</label></li>
                </ul>
            </fieldset>
            <fieldset class="options">
                <legend>Radio</legend>
                <ul>
                    <li><label for="radio1"><input id="radio1" name="radio" type="radio" class="radio" checked="checked" /> Option 1</label></li>
                    <li><label for="radio2"><input id="radio2" name="radio" type="radio" class="radio" /> Option 2</label></li>
                </ul>
            </fieldset>
            <div class="submit">
                <input class="button" type="submit" value="Post Comment" />
                <input class="button" type="button" value="Preview" />
                <a href="#">Cancel</a>
            </div>
        </fieldset>
    </form>
</div>

*[ASCII]: American Standard Code for Information Interchange
*[HTML]: HyperText Markup Language
*[BBC]: British Broadcasting Corportation
*[Staffs.]: Staffordshire
